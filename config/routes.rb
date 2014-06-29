Rails.application.routes.draw do
  # From a UX perspective, that's unfortunate: it's better to let people
  # use the system as much as possible without requiring registration.
  root 'sessions#new'
  get 'clips/search'      => 'clips#search'
  post 'clips/save'       => 'clips#save'
  get 'clips/edit/:id'    => 'clips#edit'
  post 'clips/edit/:id'   => 'clips#edit'
  delete 'clips/:id'      => 'clips#destroy'

=begin
Replace the 'clips' bit with something like this:
resources :clips, only: [:create, :edit, update, :destroy] do
  get :search
end
=end

  # Avoid using the same controller action for two routes.
  get 'shares'            => 'shares#edit'
  post 'shares/:id'       => 'shares#edit'

  get 'users'             => 'users#index', as: 'play_lists'
  get 'users/new'         => 'users#new', as: 'sign_up'
  post 'users'            => 'users#create'

  get 'sessions/new'      => 'sessions#new', as: 'log_in'
  post 'sessions'         => 'sessions#create'
  delete 'sessions'       =>  'sessions#destroy', as: 'log_out'
end
