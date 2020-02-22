Rails.application.routes.draw do
  resources :primes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/check', :controller=>'primes', :action=>'checkprime'
  post '/validate', :controller=>'primes', :action=>'isprime'
end
