require 'test_helper'

class PageStaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page_statics_index_url
    assert_response :success
  end

end
