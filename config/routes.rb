Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#show', as: 'about'
  resources :users, only: [:show, :edit, :index, :update]do
    member do
      get :followings, :followers 
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update, ]do # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    
 end
  resources :groups, only: [ :new, :create, :index, :show, :destroy, :edit, :update,]do
   resource :group_users, only: [:create, :destroy]
  end
   get 'search' => 'searches#search'
end 
