require 'test_helper'

class Customer::NotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_notify_show_url
    assert_response :success
  end

end
