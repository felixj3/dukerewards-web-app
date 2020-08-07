require 'test_helper'

class RewardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reward = rewards(:one)
  end

  test "should get index" do
    get rewards_url
    assert_response :success
  end

  test "should get new" do
    get new_reward_url
    assert_response :success
  end

  test "should create reward" do
    assert_difference('Reward.count') do
      post rewards_url, params: { reward: { category: @reward.category, description: @reward.description, end_time: @reward.end_time, expiry_quantity: @reward.expiry_quantity, expiry_time: @reward.expiry_time, location: @reward.location, name: @reward.name, points: @reward.points, start_time: @reward.start_time, status: @reward.status } }
    end

    assert_redirected_to reward_url(Reward.last)
  end

  test "should show reward" do
    get reward_url(@reward)
    assert_response :success
  end

  test "should get edit" do
    get edit_reward_url(@reward)
    assert_response :success
  end

  test "should update reward" do
    patch reward_url(@reward), params: { reward: { category: @reward.category, description: @reward.description, end_time: @reward.end_time, expiry_quantity: @reward.expiry_quantity, expiry_time: @reward.expiry_time, location: @reward.location, name: @reward.name, points: @reward.points, start_time: @reward.start_time, status: @reward.status } }
    assert_redirected_to reward_url(@reward)
  end

  test "should destroy reward" do
    assert_difference('Reward.count', -1) do
      delete reward_url(@reward)
    end

    assert_redirected_to rewards_url
  end
end
