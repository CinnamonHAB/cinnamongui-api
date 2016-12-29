require 'test_helper'

class FloorplanObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @floorplan_object = floorplan_objects(:one)
  end

  test "should get index" do
    get floorplan_objects_url, as: :json
    assert_response :success
  end

  test "should create floorplan_object" do
    assert_difference('FloorplanObject.count') do
      post floorplan_objects_url, params: { floorplan_object: { angle: @floorplan_object.angle, background_color: @floorplan_object.background_color, fill: @floorplan_object.fill, height: @floorplan_object.height, left: @floorplan_object.left, opacity: @floorplan_object.opacity, scale_x: @floorplan_object.scale_x, scale_y: @floorplan_object.scale_y, top: @floorplan_object.top, width: @floorplan_object.width } }, as: :json
    end

    assert_response 201
  end

  test "should show floorplan_object" do
    get floorplan_object_url(@floorplan_object), as: :json
    assert_response :success
  end

  test "should update floorplan_object" do
    patch floorplan_object_url(@floorplan_object), params: { floorplan_object: { angle: @floorplan_object.angle, background_color: @floorplan_object.background_color, fill: @floorplan_object.fill, height: @floorplan_object.height, left: @floorplan_object.left, opacity: @floorplan_object.opacity, scale_x: @floorplan_object.scale_x, scale_y: @floorplan_object.scale_y, top: @floorplan_object.top, width: @floorplan_object.width } }, as: :json
    assert_response 200
  end

  test "should destroy floorplan_object" do
    assert_difference('FloorplanObject.count', -1) do
      delete floorplan_object_url(@floorplan_object), as: :json
    end

    assert_response 204
  end
end
