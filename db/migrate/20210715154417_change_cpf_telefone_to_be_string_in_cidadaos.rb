class ChangeCpfTelefoneToBeStringInCidadaos < ActiveRecord::Migration[6.0]
  def change
    change_column :cidadaos, :telefone, :string
    change_column :cidadaos, :cpf, :string
  end
end
