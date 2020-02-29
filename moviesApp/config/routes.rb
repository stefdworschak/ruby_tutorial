Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/edit'

  # Define movies <> reviews relationship
  resources :movies do
  resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
