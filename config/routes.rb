RailsCalendar::Application.routes.draw do
  get "users/new"

  get "static_pages/home", :as => "home"
  get "static_pages/help", :as => "help"
  get "static_pages/impressum", :as => "impressum"
  get "static_pages/contact", :as => "contact"

  get "logout" => "sessions#destroy", :as => "logout", :via => :delete
  get "login" => "sessions#new", :as => "login"

  get "sign_up" => "users#new", :as => "sign_up"
  
  root :to => "static_pages#home"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
end
