Rails.application.routes.draw do
  resources :documents do
    resources :questions
  end
end
