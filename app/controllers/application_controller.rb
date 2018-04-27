class ApplicationController < ActionController::API
  helper_method :current_user

  # deprecated - use jwt token to find dis ish
  def current_user
    authenticate_request unless @current_user
    # debugger
    # decoded_token = HashWithIndifferentAccess.new JWT.decode()
    # decode token on user, and see if its there? need to save the token in singleton?
    # token_payload = JWT.decode()
    # @current_user ||= User.find_by(session_token: session[:session_token])
    # @current_user ? @current_user : nil
    @current_user
  end

  def log_in(user)
    debugger
    payload = {
      username: user.username,
      exp: 24.hours.from_now.to_i
    }
    token = JWT.encode(payload, Rails.application.secrets.secret_key_base)
    user.session_token = token
    if user.save!
      true
    else
      false
    end
    # return jwt with user, save in local storage, send with every request. can save on user every time, so we can look it up

    # session[:session_token] = user.session_token
  end

  def log_out
    # need to renew session token
    debugger
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def authenticate_request
    debugger
    # can skip_before_action
    # use jwt token in header to set @current_user
    headers = request.headers
    jwtoken = headers['Authorization'].split(' ').last if headers['Authorization'].present?
    decoded_token = HashWithIndifferentAccess.new JWT.decode(jwtoken, Rails.application.secrets.secret_key_base)[0]
    @current_user ||= User.find_by_username(decoded_token[:username])

  end

  def require_logged_in
    # use this as authenticate_request or call it

    if !current_user
      render json: { base: ["You are not currently logged in"] }, status: 404
    end
  end
end
