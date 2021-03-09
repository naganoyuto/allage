require 'test_helper'

class AllagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get allages_index_url
    assert_response :success
  end

end
