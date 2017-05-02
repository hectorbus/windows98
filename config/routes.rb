Rails.application.routes.draw do

  # resources :apps
  devise_for :users

  authenticated :user do
   root 'welcome#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
