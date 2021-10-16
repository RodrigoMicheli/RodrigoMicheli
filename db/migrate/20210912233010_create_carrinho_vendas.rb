class CreateCarrinhoVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :carrinho_vendas do |t|
      t.integer :cliente_id
      t.string :avatar
      t.timestamps
    end
  end
end
