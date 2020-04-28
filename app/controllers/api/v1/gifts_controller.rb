class Api::V1::GiftsController < ApplicationController
  skip_before_action :authorized

  def create
    gift = Gift.create(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        link: params[:link],
        notes: params[:notes],
        recipient_id: params[:recipient_id]
    )
  end

end
