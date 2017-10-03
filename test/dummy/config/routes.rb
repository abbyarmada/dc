Rails.application.routes.draw do
  mount DC::Engine => '/dc'
  root to: 'blog#index'
end
