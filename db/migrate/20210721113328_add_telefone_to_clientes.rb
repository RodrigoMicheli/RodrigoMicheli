class AddTelefoneToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :telefone, :string
  end
end
