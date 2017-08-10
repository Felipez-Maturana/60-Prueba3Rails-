require 'test_helper'

class MysongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mysongs_index_url
    assert_response :success
  end

end
