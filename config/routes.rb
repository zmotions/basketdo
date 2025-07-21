Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope :api do
    scope :v1 do
      resources :tasks
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'client#index', as: :app

  # Fallback path for client routing
  scope('/', format: false) do
    # Catch all for HTML 5 history routing. This must be the last route.
    get('*path', to: 'client#index')
  end
end
