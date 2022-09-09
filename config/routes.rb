Rails.application.routes.draw do
  resources :pets
  resources :families
  get 'users/show'
  root to: "tasks#index"
  resources :tasks

  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :users, only: :show

end
