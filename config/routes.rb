Rails.application.routes.draw do

  root 'welcome#index'
  get 'clips/search'      => 'clips#search'
  post 'clips/save'       => 'clips#save'
  get 'clips/edit/:id'    => 'clips#edit'
  post 'clips/edit'       => 'clips#edit'
  delete 'clips/:id'      => 'clips#destroy'

end
