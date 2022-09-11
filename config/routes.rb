Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  resources :users, only: :show
  
  resources :healths
  resources :pets
  resources :families
  resources :tasks
  
  root to: "healths#index"
  
  
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  get 'search' => 'healths#search'

end
