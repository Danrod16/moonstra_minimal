Rails.application.routes.draw do
  root :to => 'passthrough#index'
  get 'home', to:"pages#home"
  get "styleguide", to: "pages#stylguide"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :teams, only: [:new, :create, :index, :show] do
    get 'overview', to: 'dashboards#overview'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
