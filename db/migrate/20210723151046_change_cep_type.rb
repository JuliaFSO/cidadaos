class ChangeCepType < ActiveRecord::Migration[6.0]
  def change
    change_column :enderecos, :cep, :string
  end
end
