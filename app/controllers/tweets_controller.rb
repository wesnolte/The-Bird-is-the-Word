class TweetsController < ApplicationController
  respond_to :json

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

end
