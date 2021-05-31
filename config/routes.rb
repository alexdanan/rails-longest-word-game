Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/new_game', to: 'games#new_game', as: :new
  post '/score', to: 'games#score', as: :score
end
