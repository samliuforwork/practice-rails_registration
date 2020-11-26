Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :members
  # get "/", to: "books#index"
  root "books#index"

  resource :members, controller: 'sessions', only: [] do
    get 'sign_in', to: 'sessions#new' , as: 'sessions'
    post 'sign_in', to: 'sessions#create', as: 'sign_in'
  end

end