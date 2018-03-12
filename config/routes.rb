Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/', to: redirect('/')
  get '/posts/*params', to: redirect('/')

  resources :feeds
end
