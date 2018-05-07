class Api::ResetPasswordsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.generate_temp_password
      if @user.save
        NotifierMailer.reset_password(@user).deliver_now
        render json: "success"
      else
        render json: {base: "could not reset password for this account"}
      end

      # here, generate temporary password_digest
      # add new method to authenticate on that.  don't login right away, if it is correct, then force them to change the password.
      # then will be able to login with regular password
      # clear temp password
      # disable closing modal
    else
      render json: { base: "no account associated with that email" }, status: 404
    end
  end

end
