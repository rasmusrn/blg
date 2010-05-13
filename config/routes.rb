Blg::Application.routes.draw do |map|
  resources :posts, :except => [:show, :index, :delete] do
    get :manage, :on => :collection
  end
  
  resources :users, :except => [:show, :destroy]
  
  get 'login', :to => 'sessions#new'
  get 'logout', :to => 'sessions#destroy'
  post 'sessions', :to => 'sessions#create'
  
  root :to => 'posts#index'
  
  get ':permalink', :to => 'posts#show', :as => :post
  delete ':permalink', :to => 'posts#destroy'
end
