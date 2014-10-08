require 'test_helper'

class SocietynetworksControllerTest < ActionController::TestCase
  setup do
    @societynetwork = societynetworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:societynetworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create societynetwork" do
    assert_difference('Societynetwork.count') do
      post :create, societynetwork: { network_id: @societynetwork.network_id, society_id: @societynetwork.society_id }
    end

    assert_redirected_to societynetwork_path(assigns(:societynetwork))
  end

  test "should show societynetwork" do
    get :show, id: @societynetwork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @societynetwork
    assert_response :success
  end

  test "should update societynetwork" do
    patch :update, id: @societynetwork, societynetwork: { network_id: @societynetwork.network_id, society_id: @societynetwork.society_id }
    assert_redirected_to societynetwork_path(assigns(:societynetwork))
  end

  test "should destroy societynetwork" do
    assert_difference('Societynetwork.count', -1) do
      delete :destroy, id: @societynetwork
    end

    assert_redirected_to societynetworks_path
  end
end
