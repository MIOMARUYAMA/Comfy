require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_items_show_url
    assert_response :success
  end

  test "should get search" do
    get admin_items_search_url
    assert_response :success
  end
end
