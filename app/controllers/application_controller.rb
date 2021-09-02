class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params = [ :first_name, :last_name, :full_name, :matricule, :contact, :city, :role, :email, :password, :slug, :serie_bac, :status_bac, :school_name, :gender,  :status_payment]
    
      devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end  


  def after_sign_up_path_for(resource)
     # Or :prefix_to_your_route
  end
end
