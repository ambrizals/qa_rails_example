class User < ApplicationRecord
  has_many :post
  has_many :post_reply
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nama, :telepon, :username , presence: true
end
