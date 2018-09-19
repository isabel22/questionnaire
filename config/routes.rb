Rails.application.routes.draw do
  devise_for :users
  root to: "documents#index"

  resources :documents do
    resources :questions
  end
end
