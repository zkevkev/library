Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/parents", to: "authors#index"
  get "/parents/new", to: "authors#new"
  get "/parents/:id", to: "authors#show"
  post "/parents", to: "authors#create"
  get "/parents/:id/edit", to: "authors#edit"
  patch "/parents/:id", to: "authors#update"
  delete "/parents/:id", to: "authors#delete"

  get "/child_table_name", to: "books#index"
  get "/child_table_name/:id", to: "books#show"
  get "/child_table_name/:id/edit", to: "books#edit"
  patch "/child_table_name/:id", to: "books#update"
  delete "/child_table_name/:id", to: "books#delete"

  get "/parents/:parent_id/child_table_name", to: "author_books#index"
  get "/parents/:parent_id/child_table_name/new", to: "author_books#new"
  post "/parents/:parent_id/child_table_name", to: "author_books#create"
  get "/parents/:parent_id/child_table_name/sort", to: "author_books#sort"
end
