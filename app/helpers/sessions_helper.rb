module SessionsHelper
  # Sign in user
  # Remembers users login details
  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end	

  # Checks if user is signed in
  def signed_in?
    !current_user.nil?
  end  

  # Sets current user
  def current_user=(user)
    @current_user = user
  end  

  # Sets current user based on token if available
  def current_user
    # remember_token = User.encrypt(cookies[:remember_token])
    # @current_user ||= User.find_by(remember_token: remember_token)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Signs user out
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
