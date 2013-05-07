Circled::Application.routes.draw do
  resources :words, only: [:index, :new, :create, :destroy]
  root :to => 'words#index'
end
