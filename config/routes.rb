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

  resources :users, only: [:update, :show, :index]

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end
  
  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote

  end



  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
