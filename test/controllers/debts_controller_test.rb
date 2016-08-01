require 'test_helper'

class DebtsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get debts_new_url
    assert_response :success
  end

end
