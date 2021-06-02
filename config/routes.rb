Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#show', as: 'about'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update, :send_books_csv]do # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  
 
 end
end 
