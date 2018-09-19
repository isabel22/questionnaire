Rails.application.routes.draw do
  devise_for :users
  root to: "documents#index"

  resources :documents do
    get :answer
    post :create_answer
    get :show_answer
    get :show_answers
    resources :questions
  end
end
