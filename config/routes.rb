Thebirdistheworde::Application.routes.draw do
  resources :tweets, :only => [:create]

  resources :users
end
