Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "application#index"
  get '/graph', to: 'application#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
