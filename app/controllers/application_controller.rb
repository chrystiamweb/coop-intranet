class ApplicationController < ActionController::Base 
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def home
    end

    protected

    def configure_permitted_parameters
        added_attrs = [:login, :email, :password, :password_confirmation, :remember_me,:kind]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end 

    def email_required?
        false        
    end
    def email_changed?
        false        
    end
    def will_save_change_to_email?
        false        
    end
end
