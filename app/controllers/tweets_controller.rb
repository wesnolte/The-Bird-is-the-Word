class TweetsController < ApplicationController
  respond_to :json, :js, :html

  # POST /tweets
  # POST /tweets.xml
  def create
    puts "params: " + params[:tweet].inspect
    
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.json { render :json => @tweet, :notice => 'Tweet was successfully created.' }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def index
    @keywords = ["sfdc", "salesforce", "force.com", "forceDotCom", "chatter"]    
    @tweets = Tweet.all(:include => :user, :order => "twitter_created_at DESC", :limit => 20)
    
    respond_to do |format|
      format.html { render :html => @tweets, :layout => false }
      format.js { render :js => @tweets, :layout => false and return }
    end
  end

end
