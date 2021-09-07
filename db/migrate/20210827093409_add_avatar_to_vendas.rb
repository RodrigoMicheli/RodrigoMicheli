class AddAvatarToVendas < ActiveRecord::Migration[6.0]
  def change
    add_column :vendas, :avatar, :string
  end
end
