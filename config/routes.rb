Rails.application.routes.draw do

  namespace :public do
    get 'favorites/index'
    get 'favorites/create'
    get 'favorites/destroy'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    get   root to:  'homes#top'
    get   'homes/about'
    post  '/users/guest_sign_in' => 'users#guest_log_in'
    get   '/users/secession'     => 'users#secession'
    patch '/users/withdrawal'    => 'users#withdrawal'


    resources :posts,     only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create,:destroy]
    end
    resources :users,     only: [:index,:show, :edit, :update] do
      resources :favorites, only:[:index]
    end
    resources :comments,  only: [:new, :index, :show, :edit, :update]
    resources :favorites, only: [:index]
  end


  namespace :admin do
    get root to: 'homes#top'
    get 'users/post_index'   => 'users#post_index'

    resources :posts,      only: [:index, :show, :edit, :update, :destory]
    resources :users,      only: [:index, :show, :edit, :update]
    resources :comments,   only: [:index, :destroy]
    resources :genres,     only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
