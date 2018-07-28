require 'test_helper'

class CommentRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_reply = comment_replies(:one)
  end

  test "should get index" do
    get comment_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_reply_url
    assert_response :success
  end

  test "should create comment_reply" do
    assert_difference('CommentReply.count') do
      post comment_replies_url, params: { comment_reply: { content: @comment_reply.content, flag_delete: @comment_reply.flag_delete, reply_id: @comment_reply.reply_id, user_id: @comment_reply.user_id } }
    end

    assert_redirected_to comment_reply_url(CommentReply.last)
  end

  test "should show comment_reply" do
    get comment_reply_url(@comment_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_reply_url(@comment_reply)
    assert_response :success
  end

  test "should update comment_reply" do
    patch comment_reply_url(@comment_reply), params: { comment_reply: { content: @comment_reply.content, flag_delete: @comment_reply.flag_delete, reply_id: @comment_reply.reply_id, user_id: @comment_reply.user_id } }
    assert_redirected_to comment_reply_url(@comment_reply)
  end

  test "should destroy comment_reply" do
    assert_difference('CommentReply.count', -1) do
      delete comment_reply_url(@comment_reply)
    end

    assert_redirected_to comment_replies_url
  end
end
