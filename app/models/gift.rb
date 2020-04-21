class Gift < ApplicationRecord
  belongs_to :recipient
  has_many :gift_likes
end
