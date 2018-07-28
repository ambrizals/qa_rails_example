require 'test_helper'

class PostRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_reply = post_replies(:one)
  end

  test "should get index" do
    get post_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_post_reply_url
    assert_response :success
  end

  test "should create post_reply" do
    assert_difference('PostReply.count') do
      post post_replies_url, params: { post_reply: { content: @post_reply.content, flag_delete: @post_reply.flag_delete, post_id: @post_reply.post_id, user_id: @post_reply.user_id } }
    end

    assert_redirected_to post_reply_url(PostReply.last)
  end

  test "should show post_reply" do
    get post_reply_url(@post_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_reply_url(@post_reply)
    assert_response :success
  end

  test "should update post_reply" do
    patch post_reply_url(@post_reply), params: { post_reply: { content: @post_reply.content, flag_delete: @post_reply.flag_delete, post_id: @post_reply.post_id, user_id: @post_reply.user_id } }
    assert_redirected_to post_reply_url(@post_reply)
  end

  test "should destroy post_reply" do
    assert_difference('PostReply.count', -1) do
      delete post_reply_url(@post_reply)
    end

    assert_redirected_to post_replies_url
  end
end
