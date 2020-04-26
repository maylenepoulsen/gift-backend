class Api::V1::UserGroupsController < ApplicationController
  skip_before_action :authorized

  def invite
    user = User.find_by(id: params[:id])
    groups = user.user_groups
    filtered = groups.select{|group| group.status === 'pending'}
    event = filtered.map{|ug| ug.group}
    
    render json: {filtered: filtered, groups: event}
  end

  def belongs
    user = User.find_by(id: params[:id])
    groups = user.user_groups
    filtered = groups.select{|group| group.status === 'accept'}
    event = filtered.map{|ug| ug.group}

    render json: event
  end

  def update
    user_group = UserGroup.find_by(id: params[:id])
    user_group.status = params[:status]
    user_group.save
    render json: user_group
  end

  def destroy
  end
end
