require "application_system_test_case"

class RewardsTest < ApplicationSystemTestCase
  setup do
    @reward = rewards(:one)
  end

  test "visiting the index" do
    visit rewards_url
    assert_selector "h1", text: "Rewards"
  end

  test "creating a Reward" do
    visit rewards_url
    click_on "New Reward"

    fill_in "Category", with: @reward.category
    fill_in "Description", with: @reward.description
    fill_in "End time", with: @reward.end_time
    fill_in "Expiry quantity", with: @reward.expiry_quantity
    fill_in "Expiry time", with: @reward.expiry_time
    fill_in "Location", with: @reward.location
    fill_in "Name", with: @reward.name
    fill_in "Points", with: @reward.points
    fill_in "Start time", with: @reward.start_time
    check "Status" if @reward.status
    click_on "Create Reward"

    assert_text "Reward was successfully created"
    click_on "Back"
  end

  test "updating a Reward" do
    visit rewards_url
    click_on "Edit", match: :first

    fill_in "Category", with: @reward.category
    fill_in "Description", with: @reward.description
    fill_in "End time", with: @reward.end_time
    fill_in "Expiry quantity", with: @reward.expiry_quantity
    fill_in "Expiry time", with: @reward.expiry_time
    fill_in "Location", with: @reward.location
    fill_in "Name", with: @reward.name
    fill_in "Points", with: @reward.points
    fill_in "Start time", with: @reward.start_time
    check "Status" if @reward.status
    click_on "Update Reward"

    assert_text "Reward was successfully updated"
    click_on "Back"
  end

  test "destroying a Reward" do
    visit rewards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reward was successfully destroyed"
  end
end
