require 'test_helper'

class PingpongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pingpong = pingpongs(:one)
  end

  test "should get index" do
    get pingpongs_url
    assert_response :success
  end

  test "should get new" do
    get new_pingpong_url
    assert_response :success
  end

  test "should create pingpong" do
    assert_difference('Pingpong.count') do
      post pingpongs_url, params: { pingpong: {  } }
    end

    assert_redirected_to pingpong_url(Pingpong.last)
  end

  test "should show pingpong" do
    get pingpong_url(@pingpong)
    assert_response :success
  end

  test "should get edit" do
    get edit_pingpong_url(@pingpong)
    assert_response :success
  end

  test "should update pingpong" do
    patch pingpong_url(@pingpong), params: { pingpong: {  } }
    assert_redirected_to pingpong_url(@pingpong)
  end

  test "should destroy pingpong" do
    assert_difference('Pingpong.count', -1) do
      delete pingpong_url(@pingpong)
    end

    assert_redirected_to pingpongs_url
  end
end
