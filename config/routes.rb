Rails.application.routes.draw do
  root to: 'houses#index'
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  resources :houses, except: :show do
    get "join" => "houses#join"
    delete "all_destroy" => 'houses#all_destroy'
  end
end
