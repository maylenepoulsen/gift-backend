class Recipient < ApplicationRecord
  belongs_to :group
  has_many :gifts
end
