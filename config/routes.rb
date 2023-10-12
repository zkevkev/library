Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/parents", to: "authors#index"
  get "/parents/new", to: "authors#new"
  get "/parents/:id", to: "authors#show"

  get "/child_table_name", to: "books#index"
  get "/child_table_name/:id", to: "books#show"

  get "/parents/:parent_id/child_table_name", to: "author_books#index"
end
