require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get region" do
    get api_region_url
    assert_response :success
  end

end
