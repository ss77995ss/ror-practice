App::Application.routes.draw do
  root to: 'stock#index'
  get 'stock' => 'stock#index'
  get 'search' => 'stock#search'
end
