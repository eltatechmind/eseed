require 'test_helper'

class StatussControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get statuss_new_url
    assert_response :success
  end

end
