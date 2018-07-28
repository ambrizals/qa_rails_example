class Post < ApplicationRecord
  belongs_to :category

  validates :title, :content, :category_id, :user_id, presence: true
end
