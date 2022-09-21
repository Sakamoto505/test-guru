# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create, shallow: true
  end

  resources :tests, only: %i[index] do
    post :start, on: :member
  end

  resources :feedback, only: %i[new create]
  resources :badges, only: :index

  namespace :admins do
    resources :badges
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
