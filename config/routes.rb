Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do

      root 'user#index'
      
      mount_devise_token_auth_for 'User', at: :auth, controllers: {
        omniauth_callbacks: 'api/v1/users/omniauth_callbacks'
      }
      resources :users
      resources :tags
      
       get '/api/v1/auth/:provider', to: redirect('/api/v1/auth/:provider/callback', status: 301)

    end
  end
end

