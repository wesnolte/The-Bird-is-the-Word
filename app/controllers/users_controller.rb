class UsersController < ApplicationController
  respond_to :xml, :json, :http
  attr_accessor :keywords, :word_stats
  
  # GET /users
  # GET /users.xml
  def index
    @keywords = ["sfdc", "salesforce", "forceDotCom", "chatter"]
    @word_stats = {}
    
    @keywords.each do |word|
      frequencies = []
      
      records = WordStatistic.where(:word => word, :day => (DateTime.now.beginning_of_day - 5.days)..DateTime.now.end_of_day)
      
      records.each do |record|
        puts 'record: '+record.inspect
        frequencies << record.freq
      end
      
      @word_stats[word] = frequencies
      
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
