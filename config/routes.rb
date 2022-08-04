# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :tests, only: %i[index] do
      post :start, on: :member
  end




  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
