require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get products_list_url
    assert_response :success
  end

end
