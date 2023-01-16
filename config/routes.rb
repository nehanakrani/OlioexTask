Rails.application.routes.draw do
  root 'articles#index'
  post 'like', to: 'articles#like', as: 'like'
end
