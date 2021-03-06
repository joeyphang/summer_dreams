class ApplicationController < ActionController::Base
	# before_action :require_valid_user!

  # def current_user
  #   if !session[:user_id].blank?
  #     @user ||= User.find(session[:user_id])
  #   end
  # end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  # def require_valid_user!
  # 	if current_user.nil?
  # 		flash[:error] = 'Please Sign In.'
  # 		redirect_to signin_path
  # 	end
  # end

end
