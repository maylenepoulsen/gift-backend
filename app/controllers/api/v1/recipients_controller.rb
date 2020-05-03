class Api::V1::RecipientsController < ApplicationController
  #skip_before_action :authorized

  def create
    group = Group.find_by(id: params[:group][:id])
    members = params[:recipients]
    
    members.each do |member|
    new_member = Recipient.create(
          name: member['recipient'],
          event_date: member['eventDate'],
          relationship: member['relationship'],
          budget: member['budget'],
          interests: member['interests'],
          notes: member['notes'],
          group_id: group.id
       ) 
       group.recipients << new_member
    end
   
    recipients = group.recipients
    render json: {group: group, recipients: recipients}
  end
end
