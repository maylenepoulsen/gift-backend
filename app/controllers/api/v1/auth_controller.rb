class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
  def create
    #this is hit when a user logs in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: {name: @user.name, id: @user.id}, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized      
    end
  end

  private
 
  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end
