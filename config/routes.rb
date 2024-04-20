Rails.application.routes.draw do
  root 'entries#index'
  resources :entries, only: %i[index create show]
end
