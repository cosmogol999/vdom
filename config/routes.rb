Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "home#index"

  resource :doms, only: [:new, :create, :show]
  
  get "/assignments", to: "dom_assignments#index", as: "dom_assignments"
  get "/assignments/:id/start", to: "dom_assignments#start", as: "dom_assignment_start"
  get "/assignments/:id/stop", to: "dom_assignments#stop", as: "dom_assignment_stop"
end
