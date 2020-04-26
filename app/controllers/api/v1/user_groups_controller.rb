class Api::V1::UserGroupsController < ApplicationController
  skip_before_action :authorized

  def invite
    user = User.find_by(id: params[:id])
    groups = user.user_groups
    filtered = groups.select{|group| group.status === 'pending'}
    filtered_accept = groups.select{|group| group.status === 'accept'}
    event_accept = filtered_accept.map{|ug| ug.group}
    event = filtered.map{|ug| ug.group}
    
    render json: {filtered: filtered, groups: event, accept: event_accept}
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
