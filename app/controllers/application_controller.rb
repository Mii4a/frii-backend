class ApplicationController < ActionController::API
  # include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  # skip_before_action :verify_authenticity_token, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    key_attr = [:name, :email, :password, :password_confirmation, :provider, :uid]
    devise_parameter_sanitizer.permit :sign_up, keys: key_attr
  end
end
