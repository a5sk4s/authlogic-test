AuthlogicExample::Application.routes.draw do
  resources :users, :except => [:new]
  match '/register', :to => 'users#new', :as => :register

  resource :user_session, :only => [:create]
  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout

  resources :passwords, :only => [:create, :update]
  match '/forgot', :to => 'passwords#new', :as => :forgot
  match '/reset/:id', :to => 'passwords#edit', :as => :reset

  match '/activate/:activation_code', :to => 'activations#edit', :as => :activate
  match '/confirm/:id', :to => 'activations#update', :as => :confirm

  root :to => "user_sessions#new"
end
