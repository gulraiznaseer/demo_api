Rails.application.routes.draw do
  devise_for :users

  scope :api do
    resources :blogs
    resources :blogs, only: :new
  end
end
