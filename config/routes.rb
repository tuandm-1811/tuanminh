Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/index'
    as :user do 
      get "signin" => "devise/sessions#new"
      post "signin" => "devise/sessions#create"

      get "signup" => "devise/registrations#new"
      post "signup" => "devise/registrations#create"
      
      delete "signout" => "devise/sessions#destroy"
      get "signout" =>  "devise/sessions#destroy"
      
    root "static_pages#index"
    devise_for :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end