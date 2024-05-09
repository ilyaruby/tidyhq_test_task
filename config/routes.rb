Rails.application.routes.draw do
  root 'links#new'

  resources :links, only: [:new, :create]
  get '/links/:short_url', to: 'links#show', as: :shortened
  get '/s/:short_url', to: 'links#unshort', as: 'unshort'

	namespace :api do
		namespace :v1 do
			resources :links, only: [:create, :show], param: :short_url
		end
	end
end
