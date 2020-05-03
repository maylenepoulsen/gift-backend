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

  def get_likes
   likes = GiftLike.where(gift_id: params[:id])
   render json: likes
  end

  def create_likes
    gift_like = GiftLike.create(
      likes: params[:likes],
      gift_id: params[:gift_id],
      user_id: params[:user_id],
      name: params[:name]
    )
    render json: gift_like
  end

  def update_likes
    giftlikes = GiftLike.where(user_id: params[:user_id])
    gift_like = giftlikes.find_by(gift_id: params[:gift_id])
    gift_like.likes = params[:likes]
    gift_like.save
    render json: gift_like
  end

end
