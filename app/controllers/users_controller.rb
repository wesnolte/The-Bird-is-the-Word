class UsersController < ApplicationController
  respond_to :xml, :json, :http
  
  # GET /users
  # GET /users.xml
  def index
    @keywords = ["sfdc", "salesforce", "force.com", "forceDotCom", "chatter"]
    
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
    # puts "** create: " + params[:user].inspect
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # puts "format: " +format.inspect
        #format.html { render :xml => @user, :status => :created, :location => @user } #redirect_to(@user, :notice => 'User was successfully created.') }
        #format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.json { render :json => @user.id, :status => :created, :location => @user }
      else
        # puts "** somethings wrong"
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    # puts "** update"
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
