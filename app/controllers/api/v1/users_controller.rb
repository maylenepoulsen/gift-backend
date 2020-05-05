class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

def create
  #this is for sign-up
 @user = User.create(user_params)

  if @user.valid?
    @token = encode_token(user_id: @user.id)
    render json: { user: {name: @user.name, id: @user.id}, jwt: @token }, status: :created
  else
    render json: { error: 'failed to create user' }, status: :not_acceptable
  end
end

def show
  user = User.find_by(id: params[:id])
  render json: user
  token = request.headers['Authorization']
  user = User.find_by(id: token)
  if logged_in?
    render json: { id: current_user.id, name: current_user.name}
  else
    render json: {error: 'No user could be found'}, status: 401
  end

end


def profile
  render json: { user: current_user }, status: :accepted
end

private

def user_params
  params.permit(:name, :password, :email)
end

   
end 