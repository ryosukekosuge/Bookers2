class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
     if
        flash[:notice] = "Welcome! You have signed up successfully."
        user_path(resource)
     end
    end

    def after_sign_out_path_for(resource)
      if
        flash[:notice] = "Signed out successfully."
        root_path
      end
    end

    protected
    def configure_permitted_parameters
    # added_attrs = [ :name, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email]
    # devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
