require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logut" do
    get :logut
    assert_response :success
  end

end
