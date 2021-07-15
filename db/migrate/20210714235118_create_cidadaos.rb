class CreateCidadaos < ActiveRecord::Migration[6.0]
  def change
    create_table :cidadaos do |t|
      t.string :nome_completo
      t.integer :cpf
      t.string :email
      t.date :data_nascimento
      t.integer :telefone
      t.boolean :status

      t.timestamps
    end
  end
end
