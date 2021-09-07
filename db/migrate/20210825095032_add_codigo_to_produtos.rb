class AddCodigoToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :codigo, :string
  end
end
