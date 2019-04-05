Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :bands do 
    resources :albums, only: :new do
      resources :tracks, only: :new
    end 
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
end