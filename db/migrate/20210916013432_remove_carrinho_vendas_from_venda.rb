class RemoveCarrinhoVendasFromVenda < ActiveRecord::Migration[6.0]
  def change
    remove_column :vendas, :carrinho_vendas_id
  end
end
