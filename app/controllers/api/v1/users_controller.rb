class Api::V1::UsersController < ApplicationController

  def create
  user = User.create(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest]
  )
    if user.valid?
      render json: user, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
  
  end
     
end
