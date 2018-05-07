require 'test_helper'

class BusinessListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_list_index_url
    assert_response :success
  end

end
