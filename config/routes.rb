Rails.application.routes.draw do

  get 'users/update'

  # resources will create these routes automatically
  # get  '/index'
  # get  '/show'
  # get  '/new'
  # post '/create'
  # get  '/edit'
  # put  '/update'
  # post '/destroy'

  devise_for :users

  resources :questions

  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
