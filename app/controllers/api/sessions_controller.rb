class Api::SessionsController < ApplicationController
  def create
    login_name = session_params[:username] || session_params[:email]
    @user = User.find_by_credentials(login_name, session_params[:password])
    if @user && log_in(@user)
      render 'api/users/show'
    else
      render json: { base: ["Invalid login credentials"] }, status: 404
    end
  end

  def destroy
    @user = current_user
    if current_user
      log_out
      render 'api/users/show'
    else
      render json: { base: ["Can't log out when not logged in"] }, status: 404
    end
  end

  private
  def session_params
    params.require(:user).permit(:password, :username, :email)
  end
end
