AuthlogicExample::Application.routes.draw do
  resources :users
  resource :user_session, :only => [:new, :create, :destroy]
  root :to => "user_sessions#new"
  resources :password_resets, :only => [:new, :create, :edit, :update]
end
