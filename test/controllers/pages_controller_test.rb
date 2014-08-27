require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get subscription" do
    get :subscription
    assert_response :success
  end

end
