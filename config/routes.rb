Thebirdistheworde::Application.routes.draw do
  resources :tweets, :only => [:create, :index]

  resources :users, :only => [:create, :update, :index]
  
  root :to => 'users#index'
end
