json.extract! comment_reply, :id, :reply, :content, :user, :created_at, :updated_at
json.url comment_reply_url(comment_reply, format: :json)
