Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/genetic_tests/register', to: 'genetic_tests#register'
  get '/genetic_tests/:member_id/results', to: 'genetic_tests#show'
end
