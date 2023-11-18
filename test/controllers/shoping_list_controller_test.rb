require "test_helper"

class ShopingListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shoping_list_index_url
    assert_response :success
  end
end
