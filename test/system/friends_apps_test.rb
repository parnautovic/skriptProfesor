require "application_system_test_case"

class FriendsAppsTest < ApplicationSystemTestCase
  setup do
    @friends_app = friends_apps(:one)
  end

  test "visiting the index" do
    visit friends_apps_url
    assert_selector "h1", text: "Friends Apps"
  end

  test "creating a Friends app" do
    visit friends_apps_url
    click_on "New Friends App"

    fill_in "Email", with: @friends_app.email
    fill_in "First name", with: @friends_app.first_name
    fill_in "Last name", with: @friends_app.last_name
    fill_in "Phone", with: @friends_app.phone
    fill_in "Twitter", with: @friends_app.twitter
    click_on "Create Friends app"

    assert_text "Friends app was successfully created"
    click_on "Back"
  end

  test "updating a Friends app" do
    visit friends_apps_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friends_app.email
    fill_in "First name", with: @friends_app.first_name
    fill_in "Last name", with: @friends_app.last_name
    fill_in "Phone", with: @friends_app.phone
    fill_in "Twitter", with: @friends_app.twitter
    click_on "Update Friends app"

    assert_text "Friends app was successfully updated"
    click_on "Back"
  end

  test "destroying a Friends app" do
    visit friends_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friends app was successfully destroyed"
  end
end
