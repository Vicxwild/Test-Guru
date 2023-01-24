Rails.application.routes.draw do


  resources :tests, only: %i[index show] do
    resources :questions do
      resources :answers, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
