class Group < ApplicationRecord
  belongs_to :category 
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :posts
  has_many :recipients
  has_many :gifts, through: :recipients

  def add_users(members_array, id) 
    group = Group.find_by(id: id)
    members_array.each do |member|
      user = User.find_by(name: member)
      if user
        group.users << user
      end
    end
  end
end
