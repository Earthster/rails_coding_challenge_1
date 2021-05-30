Rails.application.routes.draw do
  resources :cycles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "cycles#index"
end
