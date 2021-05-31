# frozen_string_literal: true

class Api::V1::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(configure_sign_in_params)
    sign_in(resource_name, resource)
    yield resource if block_given?
    render :json
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    respond_to_on destroy
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def after_sign_in_path_for(resource)
    super(resource)
  end
end
