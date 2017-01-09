require 'test_helper'

class LinkDefinitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get link_definitions_index_url
    assert_response :success
  end

  test "should get create" do
    get link_definitions_create_url
    assert_response :success
  end

  test "should get update" do
    get link_definitions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get link_definitions_destroy_url
    assert_response :success
  end

end
