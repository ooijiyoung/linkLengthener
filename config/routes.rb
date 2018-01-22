Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  post 'newurl', to: 'pages#create', as: 'newurl'
  get 'link/:id', to: 'pages#show', as: 'url'
  get 'all', to: 'pages#all'
  delete 'del/:id', to: 'pages#destroy', as: 'del'
  get 'notfound', to: 'pages#notfound'

  get ':id', to: 'pages#redirect'

end
