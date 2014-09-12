class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :line1, :line2, :town, :county, :postcode, :password, :password_confrimation, :current_password, :avatar)}
  end

 private
  def after_sign_in_path_for(resource)
    edit_user_registration_path(current_user) #basically whichever path you think meets your needs
  end
end

#    def after_edit_user_path_for(resource)


# end



# def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up) << :name
#     devise_parameter_sanitizer.for(:account_update) << :name
#   end