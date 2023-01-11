# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'rps#index'

  resource :rps, only: :index
  get '/throw', to: 'rps#throw'
end
