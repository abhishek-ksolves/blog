class ApplicationController < ActionController::Base

	#before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  #protected
	#def configure_permitted_parameters
	#	 devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :avatar, :role, address_attributes: [:add, :id], picture_attributes: [:name, :imageable_id, :imageable_type]) }
	#	 devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password)}
	#	 devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :avatar, :email, :password, :current_password, address_attributes: [:add, :id], picture_attributes: [:name, :imageable_id, :imageable_type])}
  #end
	protected
	def configure_permitted_parameters
		 devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password) }
		 devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password)}
		 devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :avatar, :email, :password, address_attributes: [:add, :id], picture_attributes: [:name, :imageable_id, :imageable_type])}
  end
end
