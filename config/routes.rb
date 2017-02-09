Rails.application.routes.draw do
  root to: "artists#index"
  resources :artists do
    resources :songs, only: [:index, :new, :create, :edit, :update]
  end

  resources :songs, only: [:show]

  resources :users, only: [] do
    resources :playlists, except: [:destroy]
  end

  get "/auth/spotify/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
