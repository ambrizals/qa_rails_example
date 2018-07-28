require "application_system_test_case"

class PostRepliesTest < ApplicationSystemTestCase
  setup do
    @post_reply = post_replies(:one)
  end

  test "visiting the index" do
    visit post_replies_url
    assert_selector "h1", text: "Post Replies"
  end

  test "creating a Post reply" do
    visit post_replies_url
    click_on "New Post Reply"

    fill_in "Content", with: @post_reply.content
    fill_in "Flag Delete", with: @post_reply.flag_delete
    fill_in "Post", with: @post_reply.post_id
    fill_in "User", with: @post_reply.user_id
    click_on "Create Post reply"

    assert_text "Post reply was successfully created"
    click_on "Back"
  end

  test "updating a Post reply" do
    visit post_replies_url
    click_on "Edit", match: :first

    fill_in "Content", with: @post_reply.content
    fill_in "Flag Delete", with: @post_reply.flag_delete
    fill_in "Post", with: @post_reply.post_id
    fill_in "User", with: @post_reply.user_id
    click_on "Update Post reply"

    assert_text "Post reply was successfully updated"
    click_on "Back"
  end

  test "destroying a Post reply" do
    visit post_replies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post reply was successfully destroyed"
  end
end
