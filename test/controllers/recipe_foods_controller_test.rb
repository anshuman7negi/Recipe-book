require "test_helper"

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipe_foods_new_url
    assert_response :success
  end
end
