Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'search#index'
  get '/search', to: 'search#search', as: :search #TODO should be a post b/c changes data?
end