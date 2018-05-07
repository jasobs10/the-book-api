class Api::ResetPasswordsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])

    if @user
      render json: "success"
    else
      render json: { base: "no account associated with that email" }, status: 404
    end
  end

end
