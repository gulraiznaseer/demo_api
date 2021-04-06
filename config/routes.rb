Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
  end
  resource :user, only: [:show, :update]
  scope :api do
    resources :blogs
    resources :blogs, only: :new
  end
end
