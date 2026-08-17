Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
