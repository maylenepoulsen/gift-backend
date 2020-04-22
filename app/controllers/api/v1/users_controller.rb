class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]


  # @user = User.create(
  #   name: params[:name],
  #   email: params[:email],
  #   password_digest: params[:password_digest]
  # )

  def create
   @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: current_user }, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :email)
  end

     
end
