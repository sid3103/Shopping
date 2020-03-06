require 'test_helper'

class TwoWheelersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get two_wheelers_index_url
    assert_response :success
  end

  test "should get new" do
    get two_wheelers_new_url
    assert_response :success
  end

end
