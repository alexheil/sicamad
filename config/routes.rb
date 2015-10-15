Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'contact' => 'static_pages#contact'

  devise_for :admins, controllers: { sessions: "admins/sessions", registrations: "admins/registrations"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :categories, controller: 'categories/categories' do
    resources :products, controller: 'categories/products'
  end

end
