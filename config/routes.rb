Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places, except: %i[destroy edit update] do
    resources :photos, only: %i[create]
    resources :lists, only: :update
  end

  resources :lists, only: %i[create show index]
end
