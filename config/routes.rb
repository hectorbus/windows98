Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :comments
  end

  resources :pictures, :only => [:new, :create, :destroy]

  authenticated :user do
   root 'welcome#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
