Rails.application.routes.draw do
  get 'static_pages/index'
    as :user do 
      get "signin" => "devise/sessions#new"
      post "signin" => "devise/sessions#create"
      delete "signout" => "devise/sessions#destroy"
    root "static_pages#index"
    devise_for :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
