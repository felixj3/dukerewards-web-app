class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :eventScan]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end


  def eventScan
    puts "----------------eventScan"
    hash = JSON.parse params[:_json]
    hash.each do |k,v|
      puts "key: #{k} value: #{v}"
    end
    event = Event.find(hash["eventID"])
    attendance = Attendance.find_by(user_id: params[:id], event_id: event.id) 
    # hash["eventID"] refers to id in our event database
    if hash["status"] == "enter"
      if attendance == nil 
        puts "attendance is nil"
        @user.events << event
        # User.find(params[:id]).events << Event.find(hash["eventID"])
        attendance = Attendance.find_by(user_id: params[:id], event_id: event.id) 
        attendance.arrivalTime = DateTime.now
        attendance.save
        render json: {status: 'SUCCESS in enter', data: attendance, user: nil}, status: :ok
      else 
        puts "attendance is present"
        render json: {status: 'FAIL in enter', data: attendance, user: nil}, status: :ok
      end
    elsif hash["status"] == "leave"
      handleLeave(attendance, event)
    else
      if attendance == nil 
        puts "attendance is nil - none"
        @user.events << event
        attendance = Attendance.find_by(user_id: params[:id], event_id: event.id) 
        attendance.arrivalTime = DateTime.now
        attendance.exitTime = attendance.arrivalTime
        attendance.pointsEarned = event.points
        updatePoints(hash["eventCategory"], attendance.pointsEarned)
        attendance.save
        render json: {status: 'SUCCESS in none', data: attendance, user: @user}, status: :ok
      else 
        puts "attendance is present - none"
        puts attendance.id
        render json: {status: 'FAIL in none', data: attendance, user: nil}, status: :ok
      end
    end
  end

  def handleLeave(attendance, event)
    if attendance == nil
      render json: {status: 'FAIL in leave', data: nil, user: nil}, status: :ok
      puts "Error, attendance could not be nil"
    else 
      # handle edge cases
      if attendance.arrivalTime == nil 
        puts "Error, cannot exit before enter."
        render json: {status: 'FAIL in leave', data: nil, user: nil}, status: :ok 
        return
      end
      if attendance.exitTime != nil && attendance.pointsEarned != nil
        puts "Error, attended events before."
        render json: {status: 'Attended events before', data: nil, user: nil}, status: :ok 
        return
      end

      attendance.exitTime = DateTime.now
      puts "exiting?"
      attendance.stayTime = ((attendance.exitTime - attendance.arrivalTime) / 1.minutes).ceil
      puts "attendance stayTime"
      puts attendance.stayTime
      if attendance.stayTime >= event.duration
        attendance.pointsEarned = event.points
        puts "exceed"
      else 
        puts "did not exceed"
        attendance.pointsEarned = ((attendance.stayTime.to_f / event.duration.to_f) * event.points).ceil
      end
      updatePoints(hash["eventCategory"], attendance.pointsEarned)
      attendance.save
      render json: {status: 'SUCCESS in leave', data: attendance, user: @user}, status: :ok 
    end
  end
  
  def updatePoints(eventCategory, pointsEarned)
    @user.accumulated_total_points += pointsEarned
    if eventCategory == "Athletics"
      @user.athletics_points += pointsEarned
      @user.accumulated_athletics_points += pointsEarned
    else
      @user.dining_points += pointsEarned
      @user.accumulated_dining_points += pointsEarned
    end
    puts "eventCategory"
    puts eventCategory
    puts "pointsEarned"
    puts pointsEarned
    @user.save
  end


  # GET /userRewards
  def getRewards
    user = User.find_by(netid: params[:netid])
    # code should only call this when the user with this netid has a model in the database
    if user.rewards.empty?
      render json: {status: 'EMPTY', message: 'User has not redeemed any rewards'}, status: :ok
    else
      render json: {status: 'SUCCESS', message: 'Loaded user rewards', data: user.rewards}, status: :ok
      # status ok is not necessary
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html {} # automatically goes to views/users/show.html.erb
      format.json { render json: @user , status: :ok}
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usersMobile
  def updateFromMobile
    # puts params[:id]
    # puts "-------------------"
    user = User.find_by(netid: params[:netid])
    if user.update(user_params)
      user.save
      render json: {status: 'SUCCESS', message: 'Updated User Info', data: user}
    else
      render json: {status: 'ERROR', message: 'Unable to update User Info'}
    end
  end

  # GET /uniqueUsername
  def uniqueUsername
    user = User.find_by(username: params[:username])
    if user == nil
      render json: {status: 'SUCCESS', message: 'Username is not taken'}, status: :ok
    else
      render json: {status: 'REPEAT', message: 'Username already taken'}, status: :ok
    end
  end

  # GET /users/showImage/1
  def showImage
    @user = User.find_by(id: params[:id])
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /userFromToken
  def user_info
    netID = "ktc22"
    # should equal a call to application controller or something, but hard code for now
    
    exists = false
    if User.exists?(netid: netID)
        exists = true
        user = User.find_by(netid: netID)
    else
      user_json = Idmws.getNameFromNetID(netID) 
      # Idmws.rb is in lib folder, can be called from anywhere

      user = User.new(name: user_json[0]["display_name"], netid: user_json[0]["netid"], username: "", email: user_json[0]["emails"][0], accumulated_total_points: 0, accumulated_athletics_points: 0, accumulated_dining_points: 0, athletics_points: 0, dining_points: 0, primary_affiliation: user_json[0]["primary_affiliation"])
      user.save
    end
  
    render json: {status: 'SUCCESS', message: 'Got netid from access token. Sending user info', exists: exists, data: user}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :profile_pic, :accumulated_total_points, :athletics_points, :dining_points, :netid, :email, :accumulated_athletics_points, :accumulated_dining_points)
      
      # params.permit(:name, :username, :profile_pic, :accumulated_total_points, :athletics_points, :dining_points, :netid, :email)
    end
end
