require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(name: "Test", dob: DateTime.now.to_date, email: "foobar@example.com", phone_number: "0161234567")
  end

  test "should get new" do
    get signup_path 
    assert_response :success
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_path(@user)
    assert_response :success
  end

end
