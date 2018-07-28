json.extract! comment_reply, :id, :reply_id, :content, :user_id, :flag_delete, :created_at, :updated_at
json.url comment_reply_url(comment_reply, format: :json)
