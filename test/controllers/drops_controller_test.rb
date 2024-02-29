require "test_helper"

class DropsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drops_index_url
    assert_response :success
  end

  test "should get show" do
    get drops_show_url
    assert_response :success
  end
end
