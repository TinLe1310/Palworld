require "test_helper"

class PalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pals_index_url
    assert_response :success
  end

  test "should get show" do
    get pals_show_url
    assert_response :success
  end
end
