Rails.application.routes.draw do
  devise_for :users
  mount DC::Engine => '/dc'
  root to: 'page#index'

  resources :blog, component: 'blog'
  resources :links, component: 'links'
end