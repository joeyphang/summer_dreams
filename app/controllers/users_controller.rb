class UsersController < ApplicationController
	# skip_before_action :require_valid_user!
	# before_action :reset_session

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] =  'You have successfully created an account.  Please sign in to continue.'
			redirect_to signin_path
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
