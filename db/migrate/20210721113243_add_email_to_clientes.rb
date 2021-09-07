class AddEmailToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :email, :string
  end
end
