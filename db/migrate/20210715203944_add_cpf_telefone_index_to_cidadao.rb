class AddCpfTelefoneIndexToCidadao < ActiveRecord::Migration[6.0]
  def change
    add_index :cidadaos, :cpf, unique: true
    add_index :cidadaos, :telefone, unique: true
  end
end
