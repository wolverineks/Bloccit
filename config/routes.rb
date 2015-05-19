Rails.application.routes.draw do

  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/create'

  get 'questions/edit'

  get 'questions/update'

  get 'questions/destroy'

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

  resources :summary
  
  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
