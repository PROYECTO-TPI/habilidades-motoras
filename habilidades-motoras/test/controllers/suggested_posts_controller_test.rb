require 'test_helper'

class SuggestedPostsControllerTest < ActionController::TestCase
  setup do
    @suggested_post = suggested_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggested_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggested_post" do
    assert_difference('SuggestedPost.count') do
      post :create, suggested_post: { form_id: @suggested_post.form_id, publication_id: @suggested_post.publication_id }
    end

    assert_redirected_to suggested_post_path(assigns(:suggested_post))
  end

  test "should show suggested_post" do
    get :show, id: @suggested_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suggested_post
    assert_response :success
  end

  test "should update suggested_post" do
    patch :update, id: @suggested_post, suggested_post: { form_id: @suggested_post.form_id, publication_id: @suggested_post.publication_id }
    assert_redirected_to suggested_post_path(assigns(:suggested_post))
  end

  test "should destroy suggested_post" do
    assert_difference('SuggestedPost.count', -1) do
      delete :destroy, id: @suggested_post
    end

    assert_redirected_to suggested_posts_path
  end
end
