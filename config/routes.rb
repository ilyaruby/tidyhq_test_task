Rails.application.routes.draw do
  root 'links#new'
  resources :links, only: [:new, :create, :show, :unshorten]
  get '/s/:short_url', to: 'links#unshort', as: 'unshort'
end
