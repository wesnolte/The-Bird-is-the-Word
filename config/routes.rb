Thebirdistheworde::Application.routes.draw do
  resources :tweets, :only => [:create, :index]

  resources :users
end
