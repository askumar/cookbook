Cookbook::Application.routes.draw do
  resources :recipes

  devise_for :users

  root :to => 'home#index'
end
