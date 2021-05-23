Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: "sessions"}

  resources :badges, only: :index

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :passed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: %i[create]

  namespace :admin do
    resources :gists, only: :index
    resources :badges, shallow: true

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
