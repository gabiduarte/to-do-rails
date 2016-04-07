Rails.application.routes.draw do
  resources :todos

  root to: "todos#index"

  get '/todos/:id/toggle_completed', to: 'todos#toggle_completed', as: :toggle_completed
end
