class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for User, except: [:index, :show]
  #before_action :authenticate_user

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
	  def configure_permitted_parameters
	  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	  end

end
