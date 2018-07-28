json.extract! post_reply, :id, :post_id, :content, :user_id, :flag_delete, :created_at, :updated_at
json.url post_reply_url(post_reply, format: :json)
