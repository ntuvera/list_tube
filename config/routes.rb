Rails.application.routes.draw do

  root 'welcome#index'
  get 'clips/search'      => 'clips#search'
  post 'clips/save'       => 'clips#save'
  get 'clips/edit/:id'    => 'clips#edit'
  post 'clips/edit'       => 'clips#edit'
  delete 'clips/:id'      => 'clips#destroy'

  get 'users/'            => 'users#index'
  get 'users/new'         => 'users#new', as: 'sign_up'
  post 'users'            => 'users#create'
  get 'users/show'        => 'users#show'

  get 'sessions/new'      => 'sessions#new', as: 'log_in'
  post 'sessions'         => 'sessions#create'

  delete 'sessions'       =>  'sessions#destroy', as: 'log_out'
end
