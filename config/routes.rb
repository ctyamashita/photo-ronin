Rails.application.routes.draw do
  devise_for :users

  resources :users do
    get '/dashboard', to: 'users#dashboard', as: :dashboard
  end

  root to: 'pages#home'

  resources :places, except: %i[destroy edit update] do
    # resources :photos, only: %i[create]
    resources :markers, only: %i[create]
  end

  resources :lists, only: %i[create show index]

  resources :photos, only: :show
end
