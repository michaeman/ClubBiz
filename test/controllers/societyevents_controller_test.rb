require 'test_helper'

class SocietyeventsControllerTest < ActionController::TestCase
  setup do
    @societyevent = societyevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:societyevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create societyevent" do
    assert_difference('Societyevent.count') do
      post :create, societyevent: { event_id: @societyevent.event_id, society_id: @societyevent.society_id }
    end

    assert_redirected_to societyevent_path(assigns(:societyevent))
  end

  test "should show societyevent" do
    get :show, id: @societyevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @societyevent
    assert_response :success
  end

  test "should update societyevent" do
    patch :update, id: @societyevent, societyevent: { event_id: @societyevent.event_id, society_id: @societyevent.society_id }
    assert_redirected_to societyevent_path(assigns(:societyevent))
  end

  test "should destroy societyevent" do
    assert_difference('Societyevent.count', -1) do
      delete :destroy, id: @societyevent
    end

    assert_redirected_to societyevents_path
  end
end
