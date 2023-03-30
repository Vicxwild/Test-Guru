Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      patch :publish, on: :member
      patch :unpublish, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end

    resources :gists, only: :index

    resources :badges, except: :show
  end

  resource :gist, only: :create

  resource :feedback, only: %i[new create]

  resources :badges, only: :index
end
