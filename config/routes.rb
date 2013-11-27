College::Application.routes.draw do
  devise_for :users,
    controllers: { registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    root to: "registrations#new"
  end

  resources :users do
    member do
      get "onboarding"
    end
  end

  get "home/index", as: "home"
end