class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params_step_1 = [ :username, :matricule, :contact, :city, :role, :email, :password, :slug]
    sign_up_params_step_2 = [ :serie_bac, :status_bac, :school, :school_name, :gender,  :status_payment]
    
      devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params_step_1
      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params_step_2
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end   

end
