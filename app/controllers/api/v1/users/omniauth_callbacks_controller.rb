# frozen_string_literal: true
class Api::V1::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  def redirect_callbacks
    super
  end

  def omniauth_success
    super
  end

  def omniauth_failure
    super
  end

  protected
  def assign_provider_attrs(user, auth_hash)
    case auth_hash['provider']
    when 'twitter'
      user.assign_attributes({
        nickname: auth_hash['info']['nickname'],
        name: auth_hash['info']['name'],
        image: auth_hash['info']['image'],
        email: auth_hash['info']['email']
      })
    else
      super
    end
  end

  # # You should also create an action method in this controller like this:
  # def twitter
  #   callback_from(:twitter)
  # end

  # def redirect_callbacks
  #   super
  # end

  # def omniauth_success
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in @user, event: :authentication

  #     if request.env["omniauth.params"]["api_request"]
  #       render json: {status: :success, data: @user, message: "Login success"}
  #     else
  #       redirect_to after_sign_in_path_for(@user)
  #     end
  #   end
  # end

  # # GET|POST /users/auth/twitter/callback
  # def redirect_callbacks
  #   redirect_to root_path
  # end

  # protected

  # def callback_from(provider)
  #   auth = request.env['omniauth.auth']
  #   provider = provider.to_s

  #   @user = User.find_for_oauth(auth)

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.#{provider}_data"] = auth.except("extra")
  #     redirect_to new_user_session_path, alert: @user.errors.full_messages
  #   end
  # end

  # # The path used when OmniAuth fails
  # # def after_omniauth_failure_path_for(scope)
  # #   super(scope)
  # # end
end