class SessionsController < ApplicationController
	# skip_before_action :require_valid_user!, except: [:destroy]

	def new
	end

	def create
		reset_session
		@user = User.find_by(email: session_params[:email])

		if @user && @user.authenticate(session_params[:password_digest])
			if params[:remember_me]
				cookies.permanent[:remember_digest] = @user.remember_digest
			else 
				cookies[:remember_digest] = @user.remember_digest
			end
			flash[:success] = 'Hello There!'
			redirect_to root_path
		else
			flash[:error] = 'Invalid email/password combination'
			redirect_to signin_path
		end
	end

	def destroy
		cookies.delete(:remember_digest)
		reset_session
	end

	private

	def session_params
		params.require(:session).permit(:email, :password_digest)
	end

end
