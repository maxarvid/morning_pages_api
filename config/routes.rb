Rails.application.routes.draw do
  resources :morning_pages, only: [:index]
end
