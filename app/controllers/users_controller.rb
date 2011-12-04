class UsersController < ApplicationController
  respond_to :xml, :json, :http
  attr_accessor :keywords, :word_stats, :total_words
  
  # GET /users
  # GET /users.xml
  def index
    @keywords = ["salesforce", "sfdc", "chatter", "forceDotCom"]
    @word_stats = {}
    
    # get the sum of frequencies per word
    sum_per_words = WordStatistic.sum(:freq, :group => :word)
    
    # get the total number of words
    @total_words = WordStatistic.sum(:freq)
    
    # get the sum of the frequencies per word up until yesterday
    @total_words_yesterday = WordStatistic.where(["day < ?", DateTime.now.beginning_of_day]).sum(:freq)
    
    # initialise the days frequencies in case theres a day with 0
    freq_per_day = []

    for i in 0..4
      freq_per_day[i] = (DateTime.now.beginning_of_day - i.days)
    end
    
    freq_per_day.reverse!
    
    @keywords.each do |word|
      frequencies = []
      
      word_stats_last_5_days = Hash.new
      last_few_word_stats = WordStatistic.where(:word => word, :day => (DateTime.now.beginning_of_day - 4.days)..DateTime.now.end_of_day).order("day ASC")

      freq_per_day.each do |day|
        day_freq = 0

        last_few_word_stats.each do |stat|
          if (stat[:day].beginning_of_day == day) then
            day_freq = stat[:freq]
          end
        end
        frequencies << day_freq
      end
      
      @word_stats[word] = {:freq => frequencies}
      
    end
    
    @users = User.all(:include => :score, :order => "scores.value DESC", :limit => 20)
    @tweets = Tweet.all(:include => :user, :order => "twitter_created_at DESC", :limit => 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.json { render :json => @user.id, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
