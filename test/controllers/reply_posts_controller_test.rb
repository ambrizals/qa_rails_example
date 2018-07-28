require 'test_helper'

class ReplyPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reply_post = reply_posts(:one)
  end

  test "should get index" do
    get reply_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_reply_post_url
    assert_response :success
  end

  test "should create reply_post" do
    assert_difference('ReplyPost.count') do
      post reply_posts_url, params: { reply_post: { content: @reply_post.content, post: @reply_post.post, user: @reply_post.user } }
    end

    assert_redirected_to reply_post_url(ReplyPost.last)
  end

  test "should show reply_post" do
    get reply_post_url(@reply_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_reply_post_url(@reply_post)
    assert_response :success
  end

  test "should update reply_post" do
    patch reply_post_url(@reply_post), params: { reply_post: { content: @reply_post.content, post: @reply_post.post, user: @reply_post.user } }
    assert_redirected_to reply_post_url(@reply_post)
  end

  test "should destroy reply_post" do
    assert_difference('ReplyPost.count', -1) do
      delete reply_post_url(@reply_post)
    end

    assert_redirected_to reply_posts_url
  end
end
