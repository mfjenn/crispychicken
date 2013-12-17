class SessionsController < ApplicationController
  skip_before_filter :require_signin, :only => [:create, :login]

	def new
	end

	# Sets users session information
	def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_to events_path, :notice => "Welcome, #{user.firstname}!"
        else
            flash.now[:error] = 'Invalid email/password combination!'
            redirect_to root_url, :alert => "Invalid Email/Password Combination!"
        end		
	end

	def login
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to events_path, :notice => "Welcome, #{user.firstname}!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Come back soon!"
	end
end
