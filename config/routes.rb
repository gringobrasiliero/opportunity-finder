Rails.application.routes.draw do
  devise_scope :user do
        get "/sign_in" => "devise/sessions#new", as: "sign_in" # custom path to login/sign_in
        get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
        get "/edit_account " => "devise/registrations#edit", as: "edit_account"
      end
 root "welcome#home"
  get 'sessions/new'
 get '/auth/linkedin/callback' => 'sessions#create'

get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
# patch 'profiles/:id', to: 'profiles#update'
resources :profiles, only: [:show, :new, :edit]
resources :applications, only: [:edit, :index, :new, :show]

resources :opportunities do
  resources :applications, only: [:new, :edit]
end


  devise_for :users, :controllers => { :omniauth_callbacks => "authentications"}


  resources :users do
    resources :opportunities, only: [:show, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
