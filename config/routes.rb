Rails.application.routes.draw do
  root "pages#root"

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "users#index", as: :root

    resources :apps, only: [:index, :update]
    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :pages, only: [:index, :edit, :create, :update, :destroy]
  end

  get ":path", to: "pages#show", as: :page
end
