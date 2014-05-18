Rails.application.routes.draw do

  root 'welcome#index'
  get 'clips/search' => 'clips#search'
  post 'clips/save' => 'clips#save'
  delete 'clips/:id' => 'clips#destroy'
end
