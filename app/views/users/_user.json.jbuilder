json.extract! user, :id, :nama, :username, :telepon, :created_at, :updated_at
json.url user_url(user, format: :json)
