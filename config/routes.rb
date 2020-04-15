Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/books", to: "books#index"
  get "/books/:title", to: "books#show"
  post "/books/create", to: "books#create"
  put "/books/edit/:title", to: "books#update"
  delete "/books/delete/:title", to: "books#destroy"
end
