Rails.application.routes.draw do

  root 'mensjes#index'
  resources :usuarios
  resources :mensajes
  get    '/acceder',   to: 'sesiones#new'
  post   '/acceder',   to: 'sesiones#create'
  delete '/salir',  to: 'sesiones#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
