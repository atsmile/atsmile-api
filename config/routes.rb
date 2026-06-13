Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get "profile", to: "profile#show"
      get "careers", to: "careers#index"
      get "skills",  to: "skills#index"
      get "works",   to: "works#index"
      get "all",     to: "all#show"
    end
  end
end
