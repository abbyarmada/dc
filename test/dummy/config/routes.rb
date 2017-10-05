Rails.application.routes.draw do
  mount DC::Engine => '/dc'
  root to: 'blog#index', component: 'blog'

  resources :blog, component: 'blog'
  resources :links, component: 'links'
end