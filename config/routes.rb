Rails.application.routes.draw do
  root 'listing#index'

  resources :charges

  resources :jobs do
    collection do
      get :search
    end
  end

  resources :categories do
    resources :jobs
  end
end
