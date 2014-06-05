module SessionsHelper
  def current_user
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end

  def authenticate_user
    if !current_user
      redirect_to new_sessions_path
    end
  end

  def user_logged
    if !current_user
      false
    else
    	true
    end
  end
end
