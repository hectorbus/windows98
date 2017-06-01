Rails.application.routes.draw do


  devise_for :users

  # resources :users, only:[] do
  #
  # end

  authenticated :user do
   root 'welcome#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/apps/fx" => 'welcome#fx'
  get "/apps/meme" => 'welcome#meme'

end
