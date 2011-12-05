class TweetsController < ApplicationController
  respond_to :json, :js, :html
  attr_accessor :keywords

  def initialize
    @keywords = ["sfdc", "salesforce", "forcedotcom", "crm"]
  end

  # POST /tweets
  # POST /tweets.xml
  
  def create
    
    @tweet = Tweet.new(params[:tweet])
    
    # write stats
    @keywords.each do |word|
              
      if @tweet.text.downcase.include? word then
        
        stat = WordStatistic.where(:word => word, :day => DateTime.now.beginning_of_day..DateTime.now).first
        if stat.nil? then
          new_stat = WordStatistic.new(:word => word, :day => DateTime.now, :freq => 1)
          new_stat.save
        else
          
          stat.freq += 1
          stat.save
        end
      end
    end # keywords

    respond_to do |format|
      if @tweet.save
        format.json { render :json => @tweet, :notice => 'Tweet was successfully created.' }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def index    
    @tweets = Tweet.all(:include => :user, :order => "twitter_created_at DESC", :limit => 20)
    
    respond_to do |format|
      format.html { render :html => @tweets, :layout => false }
      format.js { render :js => @tweets, :layout => false and return }
    end
  end

end
