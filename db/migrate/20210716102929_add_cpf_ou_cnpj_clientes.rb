class AddCpfOuCnpjClientes < ActiveRecord::Migration[6.0]
  def change
	add_column :clientes, :cpfOuCnpj, :string
  end
end
