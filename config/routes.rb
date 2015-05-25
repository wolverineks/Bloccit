Rails.application.routes.draw do

  # get 'summaries/show'

  # get 'summary/show'

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

  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries, except: [:show]
      get '/summary' => "summaries#show"
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
