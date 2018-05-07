require 'test_helper'

class EventsListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get events_list_index_url
    assert_response :success
  end

end
