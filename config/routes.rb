Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  scope :api do
    resources :blogs do
      resources :comments
      resources :comments, only: :new
    end
    resources :blogs, only: :new
  end
end
