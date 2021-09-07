class CreateVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :vendas do |t|
      t.integer :quantidade
      t.integer :cliente_id
      t.integer :produto_id
      t.timestamps
    end
  end
end
