require 'test_helper'

class ClassChangesControllerTest < ActionController::TestCase
  setup do
    @class_change = class_changes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_changes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_change" do
    assert_difference('ClassChange.count') do
      post :create, class_change: { date1: @class_change.date1, date2: @class_change.date2, index1: @class_change.index1, index2: @class_change.index2 }
    end

    assert_redirected_to class_change_path(assigns(:class_change))
  end

  test "should show class_change" do
    get :show, id: @class_change
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_change
    assert_response :success
  end

  test "should update class_change" do
    patch :update, id: @class_change, class_change: { date1: @class_change.date1, date2: @class_change.date2, index1: @class_change.index1, index2: @class_change.index2 }
    assert_redirected_to class_change_path(assigns(:class_change))
  end

  test "should destroy class_change" do
    assert_difference('ClassChange.count', -1) do
      delete :destroy, id: @class_change
    end

    assert_redirected_to class_changes_path
  end
end
