# frozen_string_literal: true

class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :confirm_conf_sign_up_params_not_nil, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    render_new_error
  end

  # POST /resource
  def create
    @user = User.new(configure_sign_up_params)

    if @user.save
      render json: {status: 'success', data: @user}, each_serializer: UserSerializer

    else
      render json: { status: :unprocessable_entity, error: @user.errors.full_messages.join('') }
             

    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    @user = User.find(:id)
    @tag_list = configure_account_update_params[:tag_name].split(nil)
    if @user.update_attributes(configure_account_update_params)
      @user.save_tags(@tag_list)
      render json: {status: :success}
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.require(:registration).permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :tag_name)
  end

  def confirm_conf_sign_up_params_not_nil
    if configure_sign_up_params.nil?
      pp configure_sign_up_params
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :tag_name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def render_new_error
    render_error(405, I18n.t('devise_token_auth.sessions.not_supported'))
  end
end
