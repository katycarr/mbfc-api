Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :biases, only: [:index, :show]

  resources :sources, only: [:index, :show]
end
