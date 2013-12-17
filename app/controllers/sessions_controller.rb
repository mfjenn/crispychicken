class SessionsController < ApplicationController
  skip_before_filter :require_signin, :only => [:create, :login]

	def new
	end

	# Sets users session information
	def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_to events_path
        else
            flash.now[:error] = 'Invalid email/password combination'
            redirect_to root_url
        end		
	end

	def login
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to events_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
