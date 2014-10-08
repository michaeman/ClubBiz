require 'test_helper'

class AnnoucementsControllerTest < ActionController::TestCase
  setup do
    @annoucement = annoucements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:annoucements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create annoucement" do
    assert_difference('Annoucement.count') do
      post :create, annoucement: { contents: @annoucement.contents, event_id: @annoucement.event_id, society_id: @annoucement.society_id }
    end

    assert_redirected_to annoucement_path(assigns(:annoucement))
  end

  test "should show annoucement" do
    get :show, id: @annoucement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @annoucement
    assert_response :success
  end

  test "should update annoucement" do
    patch :update, id: @annoucement, annoucement: { contents: @annoucement.contents, event_id: @annoucement.event_id, society_id: @annoucement.society_id }
    assert_redirected_to annoucement_path(assigns(:annoucement))
  end

  test "should destroy annoucement" do
    assert_difference('Annoucement.count', -1) do
      delete :destroy, id: @annoucement
    end

    assert_redirected_to annoucements_path
  end
end
