class RenameColumn < ActiveRecord::Migration[6.0]
  def change
	rename_column :produtos, :departamento_id, :cliente_id
  end
end
