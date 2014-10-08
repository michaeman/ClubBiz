require 'test_helper'

class AdmineventsControllerTest < ActionController::TestCase
  setup do
    @adminevent = adminevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adminevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adminevent" do
    assert_difference('Adminevent.count') do
      post :create, adminevent: { admin_id: @adminevent.admin_id, event_id: @adminevent.event_id }
    end

    assert_redirected_to adminevent_path(assigns(:adminevent))
  end

  test "should show adminevent" do
    get :show, id: @adminevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adminevent
    assert_response :success
  end

  test "should update adminevent" do
    patch :update, id: @adminevent, adminevent: { admin_id: @adminevent.admin_id, event_id: @adminevent.event_id }
    assert_redirected_to adminevent_path(assigns(:adminevent))
  end

  test "should destroy adminevent" do
    assert_difference('Adminevent.count', -1) do
      delete :destroy, id: @adminevent
    end

    assert_redirected_to adminevents_path
  end
end
