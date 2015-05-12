Rails.application.routes.draw do
  devise_for :users
  # get 'questions/index'

  # get 'questions/show'

  # get 'questions/new'

  # get 'questions/create'

  # get 'questions/edit'

  # get 'questions/update'

  # get 'questions/destroy'

  resources :posts, :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
