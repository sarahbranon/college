College::Application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: {registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users do
    member do
      get "onboarding"
    end
  end
end