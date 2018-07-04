Rails.application.routes.draw do
  devise_scope :user do
        get "/sign_in" => "devise/sessions#new", as: "sign_in" # custom path to login/sign_in
        get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
        get "/edit_account " => "devise/registrations#edit", as: "edit_account"
      end
 root "welcome#home"
  get 'sessions/new'
 get '/auth/linkedin/callback' => 'sessions#create'
get 'users/:id/opportunities/application_data', to: 'opportunities#application_data'
get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
get 'applications/:id/submitted', to: 'applications#submitted', as: :submitted_profile
get 'opportunities/:id/opportunity_data', to: 'opportunities#opportunity_data'

resources :profiles

resources :applications

resources :opportunities do
  resources :applications
end

devise_for :users, :controllers => { :omniauth_callbacks => "authentications"}

resources :users do
  resources :opportunities
end

end
