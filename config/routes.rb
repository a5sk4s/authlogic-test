AuthlogicExample::Application.routes.draw do
  resources :users, :except => [:new]
  get '/register', :to => 'users#new', :as => :register

  resource :user_session, :only => [:create]
  get '/login', :to => 'user_sessions#new', :as => :login
  delete '/logout', :to => 'user_sessions#destroy', :as => :logout

  resources :passwords, :only => [:create, :update]
  get '/forgot', :to => 'passwords#new', :as => :forgot
  get '/reset/:id', :to => 'passwords#edit', :as => :reset

  get '/activate/:activation_code', :to => 'activations#edit', :as => :activate
  put '/confirm/:id', :to => 'activations#update', :as => :confirm

  root :to => "users#current"
end
