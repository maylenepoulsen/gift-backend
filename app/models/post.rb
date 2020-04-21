class Post < ApplicationRecord
  belongs_to :group
  has_many :gifts
end
