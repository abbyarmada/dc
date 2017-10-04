Rails.application.routes.draw do
  mount DC::Engine => '/dc'
  root to: 'blog#index', component: 'blog'

  resources :blog, controller: 'blog', component: 'blog'
  resources :links, controller: 'links', component: 'link'
end