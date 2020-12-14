Rails.application.routes.draw do
  devise_for :teams
  root to: 'games#index'
  resources :members
  resources :games do
    resources :batting_orders
  end
end
