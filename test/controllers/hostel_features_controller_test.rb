require 'test_helper'

class HostelFeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hostel_features_index_url
    assert_response :success
  end

  test "should get create" do
    get hostel_features_create_url
    assert_response :success
  end

  test "should get update" do
    get hostel_features_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hostel_features_destroy_url
    assert_response :success
  end

end
