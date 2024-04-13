Rails.application.routes.draw do
  root 'entries#index'
  resources :entries, only: [:index, :create]
end
