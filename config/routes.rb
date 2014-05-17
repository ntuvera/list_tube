Rails.application.routes.draw do

  root 'welcome#index'
  get 'clips/search' => 'clips#search'
  post 'clipss/save' => 'clips#save'
  delete 'clips/:id' => 'clips#destroy'
end
