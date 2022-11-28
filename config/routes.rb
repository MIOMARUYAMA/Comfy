Rails.application.routes.draw do

  namespace :admin do
    get 'review/index'
  end
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    get 'end_users/unsubscribe'
    patch 'end_users/withdrawal'
    get 'registrations/new'
    resources :end_users, only: [:show] do
      member do
        get :draft
      end
    end
    get 'items/search'
    resources :items, only: [:show, :index] do
      resource :reviews, only: [:new, :create]
    end
    resources :reviews, only: [:edit, :update, :destroy, :show] do
      resource :favorites, only: [:create, :destroy]
    end

    end
  namespace :admin do
    resources :end_users, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :items, only: [:new, :show, :create]
    get 'homes/top'
  end

  root to: 'homes#top'
  get '/about'=>'homes#about'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
