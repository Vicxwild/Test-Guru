Rails.application.routes.draw do


  resources :tests, only: %i[index show] do
    resources :questions do
      resources :answers
    end
  end
end
