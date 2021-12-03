Rails.application.routes.draw do
  resources :carrinho_vendas
  resources :vendas
  get 'sessions/new'
  get 'users/new'
  resources :clientes
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  resources :produtos
	root to: "sessions#new"
	resources :users
	get    'sign_in'   => 'sessions#new'
	post   'sign_in'   => 'sessions#create'
	delete 'sign_out'  => 'sessions#destroy'
end