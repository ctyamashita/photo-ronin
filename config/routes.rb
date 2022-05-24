Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    get :dashboard
  end

  root to: 'places#index'

  resources :places, except: %i[destroy edit update] do
    collection do
      get :map_search
    end
    # resources :photos, only: %i[create]
    resources :markers, only: %i[create]
  end

  resources :lists, only: %i[create show index]

  resources :photos, only: :show

end
