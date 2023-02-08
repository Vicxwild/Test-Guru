Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: %i[index show] do
    resources :questions do
      resources :answers, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
