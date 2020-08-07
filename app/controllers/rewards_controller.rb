class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  # GET /rewards
  # GET /rewards.json
  def index
    # @rewards = Reward.all
    @rewards = Reward.order('created_at DESC')
    @rewards.each do |reward|
      if reward.photo.attached?
        reward.image = url_for(reward.photo)
      end
    end
    # render json: {status: 'SUCCESS', message: 'Loaded rewards', data:@rewards}, status: :ok
    respond_to do |format|
        format.html 
        format.json { render json: {status: 'SUCCESS', message: 'Loaded rewards', data:@rewards}, status: :ok}
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        InfoMailer.with(reward: @reward).new_reward_email.deliver_later
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1
  # PATCH/PUT /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end    
  end

  def editRedemption
    puts params[:id]
    set_reward
  end

  # GET /rewards/testEmail
  def testEmail
    InfoMailer.with(reward: Reward.first, user: User.first).new_reward_email.deliver_later
  end

  # PATCH/PUT /redeem/1
  def redeemReward
    # get user and reward
    reward = Reward.find_by(id: params[:id])
    user = User.find_by(netid: params[:netid])
    if user == nil || reward == nil
      render json: {status: 'ERROR', message: 'Reward quantity not updated. User and/or Reward not found'}, status: :unprocessable_entity
      return
    end

    # user already redeemed this reward
    if user.rewards.include?(reward)
      render json: {status: 'REPEAT', message: 'User already redeemed reward'}
      return
    end

    
    if(reward.expiry_quantity < 1)
        render json: {status: 'ERROR', message: 'No Reward Left'}
        return
    else
        reward.expiry_quantity = reward.expiry_quantity - 1
        reward.save
    end

    # Xcode made the check for if the user had enough points but we'll check again
    # Ideally that is updated every time the user gains more points with a GET request
    if reward.category.downcase == "athletics"
      if reward.points > user.athletics_points
        render json: {status: 'ERROR', message: 'Insufficient athletic points'}
        return
      else
        user.athletics_points = user.athletics_points - reward.points
        user.save
      end
    elsif reward.category.downcase == "dining"
      if reward.points > user.dining_points
        render json: {status: 'ERROR', message: 'Insufficient dining points'}
        return
      else
        user.dining_points = user.dining_points - reward.points
        user.save
      end
    else
      render json: {status: 'ERROR', message: 'Reward category error'}
      return
    end

    # link user with reward
    user.rewards << reward

    # give QR code to this redemption model
    redemption = Redemption.find_by(user_id: user.id, reward_id: reward.id)
    redemption.QRcode = redemption.hash
    redemption.save

    # eventually do something with user email to reward email
    InfoMailer.with(reward: reward, user: user).new_reward_email.deliver_later

    # puts("----------------------------------------\n")
    # puts(user.dining_points)
    # puts(user.athletics_points)
    # puts("----------------------------------------\n")

    render json: {status: 'SUCCESS', message: 'Updated reward quantity and user points', data: user, reward: reward}, status: :ok
  end

  # GET /confirmReward/:qrcode
  def confirmReward
    # admin scans user reward to confirm their reward
    redemption = Redemption.find_by(QRcode: params[:qrcode])
    if redemption == nil
      render json: {status: 'FAILED'}
    else
      if redemption.dateHandled == nil
        user = User.find_by(id: redemption.user_id)
        reward = Reward.find_by(id: redemption.reward_id)
        redemption.adminNetID = params[:netid]
        redemption.dateHandled = DateTime.now
        redemption.save
        render json: {status: 'SUCCESS', data: {studentName: user.name, rewardName: reward.name}}
      else
        render json: {status: 'REPEAT'}
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reward_params
      params.require(:reward).permit(:name, :start_time, :end_time, :location, :description, :points, :category, :expiry_time, :expiry_quantity, :email, :image, :photo)
      # this doesn't seem to affect what parameters gets through from a PATCH request
    end
end
