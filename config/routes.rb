Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :users, only: [] do
    get '/dashboard', to: 'users#dashboard', as: :dashboard
  end

  root to: 'pages#home'

  resources :places, except: %i[destroy edit update] do
    resources :photos, only: %i[create]
    resources :markers, only: %i[create]
    resources :lists, only: :create
    resources :reviews, only: :create
  end

  resources :lists, only: %i[show index]
  resources :photos, only: :show do
    member do
      post :like
    end
  end


  get '/tagged', to: "places#tagged", as: :tagged
end
