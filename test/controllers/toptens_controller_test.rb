require "test_helper"

class ToptensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get toptens_index_url
    assert_response :success
  end
end
