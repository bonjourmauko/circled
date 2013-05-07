Circled::Application.routes.draw do
  resources :words, only: [:index, :new, :create]
  root :to => 'words#index'
end
