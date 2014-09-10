require 'test_helper'

class ContentControllerTest < ActionController::TestCase
  test "should get fruit" do
    get :fruit
    assert_response :success
  end

  test "should get veg" do
    get :veg
    assert_response :success
  end

  test "should get mix" do
    get :mix
    assert_response :success
  end

end
