Rails.application.routes.draw do
 root'homes#top'
 devise_for :users
  get 'home/about' => 'homes#show',as: 'about'
  resources :books,only: [:new, :create, :index, :show, :destroy,:edit,:update]# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :users,only: [:show,:edit,:index,:update,]
end