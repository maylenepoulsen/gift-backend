class Group < ApplicationRecord
  belongs_to :category 
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :posts
  has_many :recipients
  has_many :gifts, through: :recipients
end
