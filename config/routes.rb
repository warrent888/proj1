Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'pokemons/capture', to: 'pokemons#capture' , as: :capture
  patch 'pokemons/damage', to: 'pokemons#damage' , as: :damage
  post 'pokemons/create', to: 'pokemons#create', as: :create
  get 'pokemons/new', to: 'pokemons#new'
end
