require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root "kind_transactions#index"

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :file_uploads, only: [:create, :new]

  resources :kind_transactions, only: [:index]
end
