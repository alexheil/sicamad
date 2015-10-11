Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations"}

  devise_scope :user do
    get "sign_out", to: "users/sessions#destroy"
    get "sign_in", to: "users/sessions#new"
    get "register", to: "users/registrations#new"
  end

  devise_for :admins, controllers: { sessions: "admins/sessions", registrations: "admins/registrations"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :categories, controller: 'categories/categories' do
    resources :products, controller: 'categories/products'
  end

end
