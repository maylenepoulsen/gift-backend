class Api::V1::GroupsController < ApplicationController
  skip_before_action :authorized
  
  def create
    category_id = Category.find_by(event_name: params[:event_name]).id
    new_group = Group.create(
      name: params[:name],
      admin_user_id: params[:admin_user_id],
      category_id: category_id
    )
    
    byebug
    new_group.add_users(params[:members], new_group.id)
 
  end
end
