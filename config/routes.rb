Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :users, except: [:destroy]
  resource :sessions, only: [:create, :new, :destroy]

  resources :photos, except: [:destroy] do
    resources :likes
    resources :comments
  end

end
