class RemoveClientesFromVendas < ActiveRecord::Migration[6.0]
  def change
    remove_column :vendas, :cliente_id
    remove_column :vendas, :avatar
  end
end
