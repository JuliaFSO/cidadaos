class CreateEnderecos < ActiveRecord::Migration[6.0]
  def change
    create_table :enderecos do |t|
      t.integer :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.integer :codigo_ibge
      t.references :cidadao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
