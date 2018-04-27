Rails.application.routes.draw do
  devise_scope :user do
        get "/sign_in" => "devise/sessions#new", as: "sign_in" # custom path to login/sign_in
        get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
      end
 root "welcome#home"
  get 'sessions/new'
 get '/auth/linkedin/callback' => 'sessions#create'

# get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
# patch 'profiles/:id', to: 'profiles#update'
resources :profiles
resources :applications
resources :opportunities do
  resources :applications
  resources :users
end

  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "authentications"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
