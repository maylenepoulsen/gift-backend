class Api::V1::GroupsController < ApplicationController
  skip_before_action :authorized
  
  def create
    category_id = Category.find_by(event_name: params[:event_name]).id
    new_group = Group.create(
      name: params[:name],
      admin_user_id: params[:admin_user_id],
      category_id: category_id
    )
    
    new_group.add_users(params[:members], new_group.id)

    render json: new_group
  end

  def posts
   post = Post.create(
    body: params[:body],
    date: params[:date],
    name: params[:name],
    user_id: params[:user_id],
    group_id: params[:group_id]
   )  
   render json: post
  end

  def show
    group = Group.find_by(id: params[:id])
    admin = User.find_by(id: group.admin_user_id)
    users = []
    usergroups = UserGroup.where(group_id: params[:id]).select{|ug| ug.status === 'accept'}
    usergroups.each{|ug| users << User.find_by(id: ug.user_id)}
    recipients = group.recipients
    posts = group.posts
    gifts = []
    recipients.each {|recipient| gifts << recipient.gifts}
    
    render json: {group: group, members: users, recipients: recipients, gifts: gifts, posts: posts, admin: admin}
  end
end
