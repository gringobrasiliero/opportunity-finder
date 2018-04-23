Rails.application.routes.draw do
  devise_scope :user do
        get "/sign_in" => "devise/sessions#new", as: "sign_in" # custom path to login/sign_in
        get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
      end

  get 'sessions/new'


# get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
# patch 'profiles/:id', to: 'profiles#update'
resources :profiles
resources :applications
resources :opportunities do
  resources :applications
end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "welcome#home"


end
