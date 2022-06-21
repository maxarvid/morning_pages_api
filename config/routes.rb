Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :themes, only: [:index] do
    resources :morning_pages, only: %i[create]
  end
  resources :morning_pages, only: %i[index show destroy]
end
