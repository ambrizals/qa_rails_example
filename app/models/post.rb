class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_reply

  validates :title, :content, :category_id, :user_id, presence: true
end
