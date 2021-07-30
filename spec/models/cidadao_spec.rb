require 'rails_helper'

RSpec.describe Cidadao, type: :model do
  context 'model validacao' do
    let(:cidadao) { build(:cidadao, data_nascimento: 15.year.ago.to_date) }
    before do
      cidadao.endereco = build(:endereco, cidadao_id: cidadao.id)
    end

    it 'validar presenca de attrs' do
      expect(cidadao).to be_valid # n
    end

    it 'validar data de nascimento inclusa na range' do
      cidadao.data_nascimento = Date.today.end_of_month

      expect(cidadao).to be_invalid
    end

    it 'validar se cpf e valido e unico' do
      cidadao.cpf = '11111111111'

      cidadao.valid?
      expect(cidadao.errors[:cpf]).to contain_exactly 'cpf precisa ser valido'
    end

    describe 'validar attrs associados' do
      it { is_expected.to accept_nested_attributes_for(:endereco) }
    end
  end

end
