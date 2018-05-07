Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy] do
      resource :reset_password, only: [:create]
    end
    resources :users, only: [:create, :update, :show]
  end
end
