require 'test_helper'

class SeriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get series_show_url
    assert_response :success
  end

end
