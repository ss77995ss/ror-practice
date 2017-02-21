App::Application.routes.draw do
  root to: 'stock#index'
  get 'stock' => 'stock#index'
end
