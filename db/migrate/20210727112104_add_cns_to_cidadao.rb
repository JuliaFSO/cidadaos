class AddCnsToCidadao < ActiveRecord::Migration[6.0]
  def change
    add_column :cidadaos, :cns, :string
  end
end
