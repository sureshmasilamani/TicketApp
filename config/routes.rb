Rails.application.routes.draw do
  resources :tickets
  root to: 'tickets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
