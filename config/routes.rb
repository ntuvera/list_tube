Rails.application.routes.draw do

  root 'sessions#new'
  get 'clips/search'      => 'clips#search'
  post 'clips/save'       => 'clips#save'
  get 'clips/edit/:id'    => 'clips#edit'
  post 'clips/edit/:id'   => 'clips#edit'
  delete 'clips/:id'      => 'clips#destroy'

  get 'shares'            => 'shares#edit'
  post 'shares/:id'       => 'shares#edit'

  get 'users'             => 'users#index', as: 'play_lists'
  get 'users/new'         => 'users#new', as: 'sign_up'
  post 'users'            => 'users#create'

  get 'sessions/new'      => 'sessions#new', as: 'log_in'
  post 'sessions'         => 'sessions#create'
  delete 'sessions'       =>  'sessions#destroy', as: 'log_out'
end
