require 'test_helper'

class ReservedRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get reserved_rooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reserved_rooms_destroy_url
    assert_response :success
  end

end
