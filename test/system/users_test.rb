require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Athletics points", with: @user.athletics_points
    fill_in "Dining points", with: @user.dining_points
    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Netid", with: @user.netid
    fill_in "Profile pic", with: @user.profile_pic
    fill_in "Total points", with: @user.accumulated_total_points
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Athletics points", with: @user.athletics_points
    fill_in "Dining points", with: @user.dining_points
    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Netid", with: @user.netid
    fill_in "Profile pic", with: @user.profile_pic
    fill_in "Total points", with: @user.accumulated_total_points
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
