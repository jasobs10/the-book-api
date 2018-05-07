class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save && log_in(@user)
      NotifierMailer.welcome(@user).deliver_now
      render :show
    else
      render json: @user.errors.messages, status: 405
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
    # move to service
    if user_params[:password]
      login_name = user_params[:username]
      @user = User.find_by_credentials(login_name, user_params[:temp_password])
      if @user
        @user.password = user_params[:password]
        @user.temp_password = nil
        if @user.save && log_in(@user)
          render :show
        end
      else
        render json: {base: "Invalid credentials"}
      end
    end
    # if current_user.id == params[:id].to_i
    #   @user = User.find(params[:id])
    #   @user.update(user_params)
    #
    #   if @user.save
    #     render :show
    #   else
    #     render json: @user.errors, status: 404
    #
    #   end
    # else
    #   render json: {base: ["You cannot edit this account"]}, status: 404
    # end
  end

  private
  def user_params
    params.require(:user).permit(:password, :username, :f_name, :l_name, :motto, :email, :temp_password)
  end
end
