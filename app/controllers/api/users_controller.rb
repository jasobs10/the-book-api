class Api::UsersController < ApplicationController
  def create
    debugger
    @user = User.new(user_params)
    debugger
    if @user.save
      log_in(@user)
      render :show
    else
      render json: @user.errors, status: 404
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render json: {currentUser: null}
    end
  end

  def update
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @user.update(user_params)

      if @user.save
        render :show
      else
        render json: @user.errors, status: 404

      end
    else
      render json: {base: ["You cannot edit this account"]}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :username, :f_name, :l_name, :motto, :email)
  end
end
