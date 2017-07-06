Rails.application.routes.draw do
  resources :queries
	devise_for :users
	root 'pages#index'

	get 'pages/show'
	get 'tweets/search'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
