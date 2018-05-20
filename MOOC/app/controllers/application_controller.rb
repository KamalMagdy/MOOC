class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      added_attrs = [:name, :email, :password, :password_confirmation, :birth, :gender, :avatar ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def after_sign_up_path_for(resource)
		'/courses'
  	end

  	def after_sign_in_path_for(resource)
		'/courses'
  	end
    
    def back
      url = request.referer.to_s
      url == "" || url == request.url ? root_path : url
    end
end
