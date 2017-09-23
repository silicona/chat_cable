Rails.application.routes.draw do

  root 'mensajes#index'
  resources :usuarios
  resources :mensajes
  get    '/acceder',   to: 'sesiones#new'
  post   '/acceder',   to: 'sesiones#create'
  delete '/salir',  to: 'sesiones#destroy'

  get '/chat', to: 'mensajes#index'
  # Cap 4.1 - Incluir ActionCable
  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
