json.extract! reply_post, :id, :post, :content, :user, :created_at, :updated_at
json.url reply_post_url(reply_post, format: :json)
