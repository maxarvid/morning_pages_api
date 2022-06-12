Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :morning_pages, only: [:index]
end
