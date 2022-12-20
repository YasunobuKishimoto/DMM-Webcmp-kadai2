Rails.application.routes.draw do
  #get 'books/top'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books
  root :to => 'books#top'
end
