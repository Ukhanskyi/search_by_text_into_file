# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :documents do
    collection do
      post :search, to: 'documents#search'
    end
  end
  root 'documents#index'
end
