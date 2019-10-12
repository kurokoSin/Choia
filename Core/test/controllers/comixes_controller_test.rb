require 'test_helper'

class ComixesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comix = comixes(:one)
  end

  test "should get index" do
    get comixes_url, as: :json
    assert_response :success
  end

  test "should create comix" do
    assert_difference('Comix.count') do
      post comixes_url, params: { comix: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show comix" do
    get comix_url(@comix), as: :json
    assert_response :success
  end

  test "should update comix" do
    patch comix_url(@comix), params: { comix: {  } }, as: :json
    assert_response 200
  end

  test "should destroy comix" do
    assert_difference('Comix.count', -1) do
      delete comix_url(@comix), as: :json
    end

    assert_response 204
  end
end
