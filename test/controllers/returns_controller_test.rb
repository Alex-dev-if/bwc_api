require "test_helper"

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get returns_create_url
    assert_response :success
  end
end
