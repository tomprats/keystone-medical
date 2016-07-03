Rails.application.routes.draw do
  root "pages#root"

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "procedures#index", as: :root

    resources :apps, only: [:index, :update]
    resources :pages, only: [:index, :edit, :create, :update, :destroy]
    resources :organizations, only: [:index, :edit, :create, :update, :destroy]
    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :procedures, only: [:index, :edit, :create, :update, :destroy]
  end

  get ":path", to: "pages#show", as: :page
end
