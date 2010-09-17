AuthlogicExample::Application.routes.draw do
  resources :users

  resource :user_session, :only => [:create]
  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout

  resources :password_resets, :only => [:create, :update]
  match '/forgot', :to => 'password_resets#new', :as => :forgot
  match '/reset/:id', :to => 'password_resets#edit', :as => :reset

  match '/activate/:activation_code', :to => 'activations#edit', :as => :activate
  match '/confirm/:id', :to => 'activations#update', :as => :confirm

  root :to => "user_sessions#new"
end
