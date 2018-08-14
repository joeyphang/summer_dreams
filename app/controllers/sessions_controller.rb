class SessionsController < ApplicationController
	# skip_before_action :require_valid_user!, except: [:destroy]

	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])

		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			flash[:success] = 'Hello There!'
			redirect_to root_path
		else
			flash[:error] = 'Invalid email/password combination'
			redirect_to signin_path
		end
	end

	def destroy
	    session.delete(:user_id)
	    @current_user = nil
		redirect_to root_path
		flash[:notice] = 'Successfully signed out.'
	end

	def create_from_omniauth
	  auth_hash = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
	  # if: previously already logged in with OAuth
	  if authentication.user
	    user = authentication.user
	    authentication.update_token(auth_hash)
	    @next = root_url
	    @notice = "Signed in!"
	  # else: user logs in with OAuth for the first time
	  else
	    user = User.create_with_auth_and_hash(authentication, auth_hash)
	    # you are expected to have a path that leads to a page for editing user details
	    @next = edit_user_path(user)
	    @notice = "User created. Please confirm or edit details"
	  end

	  sign_in(user)
	  redirect_to @next, :notice => @notice
	end

	private

	def session_params
		params.require(:session).permit(:email, :password)
	end

end
