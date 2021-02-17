require "test_helper"

class FriendsAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_app = friends_apps(:one)
  end

  test "should get index" do
    get friends_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_friends_app_url
    assert_response :success
  end

  test "should create friends_app" do
    assert_difference('FriendsApp.count') do
      post friends_apps_url, params: { friends_app: { email: @friends_app.email, first_name: @friends_app.first_name, last_name: @friends_app.last_name, phone: @friends_app.phone, twitter: @friends_app.twitter } }
    end

    assert_redirected_to friends_app_url(FriendsApp.last)
  end

  test "should show friends_app" do
    get friends_app_url(@friends_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_friends_app_url(@friends_app)
    assert_response :success
  end

  test "should update friends_app" do
    patch friends_app_url(@friends_app), params: { friends_app: { email: @friends_app.email, first_name: @friends_app.first_name, last_name: @friends_app.last_name, phone: @friends_app.phone, twitter: @friends_app.twitter } }
    assert_redirected_to friends_app_url(@friends_app)
  end

  test "should destroy friends_app" do
    assert_difference('FriendsApp.count', -1) do
      delete friends_app_url(@friends_app)
    end

    assert_redirected_to friends_apps_url
  end
end
