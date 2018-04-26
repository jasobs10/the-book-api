class ApplicationController < ActionController::API
  helper_method :current_user

  # deprecated - use jwt token to find dis ish
  def current_user
    debugger
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user ? @current_user : nil
  end

  def log_in(user)
    debugger
    session[:session_token] = user.session_token
  end

  def log_out
    debugger
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def require_logged_in
    if !current_user
      render json: { base: ["You are not currently logged in"] }, status: 404
    end
  end
end
