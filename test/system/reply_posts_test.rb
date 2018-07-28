require "application_system_test_case"

class ReplyPostsTest < ApplicationSystemTestCase
  setup do
    @reply_post = reply_posts(:one)
  end

  test "visiting the index" do
    visit reply_posts_url
    assert_selector "h1", text: "Reply Posts"
  end

  test "creating a Reply post" do
    visit reply_posts_url
    click_on "New Reply Post"

    fill_in "Content", with: @reply_post.content
    fill_in "Post", with: @reply_post.post
    fill_in "User", with: @reply_post.user
    click_on "Create Reply post"

    assert_text "Reply post was successfully created"
    click_on "Back"
  end

  test "updating a Reply post" do
    visit reply_posts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @reply_post.content
    fill_in "Post", with: @reply_post.post
    fill_in "User", with: @reply_post.user
    click_on "Update Reply post"

    assert_text "Reply post was successfully updated"
    click_on "Back"
  end

  test "destroying a Reply post" do
    visit reply_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reply post was successfully destroyed"
  end
end
