class RemoveClienteIdToProdutos < ActiveRecord::Migration[6.0]
  def change
    remove_column :produtos, :cliente_id
  end
end
