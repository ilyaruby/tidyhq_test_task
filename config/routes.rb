Rails.application.routes.draw do
  root 'links#new'

  resources :links, only: [:new, :create]
  get '/links/:shortened_url', to: 'links#show', as: :shortened
  get '/s/:short_url', to: 'links#unshort', as: 'unshort'
end
