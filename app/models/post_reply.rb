class PostReply < ApplicationRecord
	belongs_to :post
	belongs_to :user

	# validates :post_id, :content, :user_id, :flag_delete, presence: true
end
