AuthlogicExample::Application.routes.draw do
  resources :users
  resource :user_session, :only => [:new, :create, :destroy]
  root :to => "user_sessions#new"
  resources :password_resets, :only => [:new, :create, :edit, :update]
  match '/activate/:activation_code', :to => 'activations#edit', :as => :activate
  match '/confirm/:id', :to => 'activations#update', :as => :confirm
end
