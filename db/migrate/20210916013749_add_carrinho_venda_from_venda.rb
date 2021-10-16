class AddCarrinhoVendaFromVenda < ActiveRecord::Migration[6.0]
  def change
    add_column :vendas, :carrinho_venda_id, :integer
  end
end
