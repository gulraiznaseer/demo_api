Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  scope :api do
    resources :blogs
    resources :blogs, only: :new
  end
end
