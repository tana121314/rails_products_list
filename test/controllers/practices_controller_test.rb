require 'test_helper'

class PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get practices_index_url
    assert_response :success
  end

end
