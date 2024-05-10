Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/", to: "welcome#index"
  get "/trainers", to: "trainers#index"
  get "/trainers/new", to: "trainers#new"
  get "/trainers/:trainer_id", to: "trainers#show"
  get "/pokemons", to: "pokemons#index"
  get "/pokemons/:pokemon_id", to: "pokemons#show"
  get "/trainers/:trainer_id/pokemons", to: "trainer_pokemons#index"
  post "/trainers", to: "trainers#create"
  get "/trainers/:trainer_id/edit", to: "trainers#edit"
  patch "/trainers/:trainer_id", to: "trainers#update"
end
