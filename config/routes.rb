Rails.application.routes.draw do
  resources :healths
  resources :pets
  resources :families
  get 'users/show'
  root to: "families#new"
  resources :tasks

  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :users, only: :show
  
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  get 'search' => 'healths#search'

end
