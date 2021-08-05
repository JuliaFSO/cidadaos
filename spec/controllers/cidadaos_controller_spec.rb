require 'rails_helper'

RSpec.describe CidadaosController do
  let!(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:cidadaos) { create_list(:cidadao, 5) }

    before { get :index }

    it 'validate status' do
      expect(response).to  have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to  render_template(:index)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'validate status' do
      expect(response).to have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to render_template(:new)
    end

    it 'validate new object' do
      expect(assigns(:cidadao)).to be_a_new(Cidadao)
    end
  end

  describe 'POST #create' do
    let(:cidadao_params) { attributes_for(:cidadao, data_nascimento: '2001-06-06'.to_date) }
    let(:endereco_params) { attributes_for(:endereco) }

    context 'When cidadao have valid params', aggregate_failures: true do
      it 'validate create object' do
        expect{
          post :create, params: { cidadao: cidadao_params.merge!(endereco_attributes: endereco_params) }
        }.to change(Cidadao, :count).by(1)
      end

      it 'validate status' do
        post :create, params: { cidadao: cidadao_params.merge!(endereco_attributes: endereco_params) }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to cidadaos_path
        expect(flash[:notice]).to eq 'Incluido com sucesso!'
      end
    end

    context 'When cidadao have invalid params' do
      it 'validate create object' do
        expect{
          post :create, params: { cidadao: { nome_completo: 'Julia Fachin', data_nascimento: Date.tomorrow}.merge!(endereco_attributes: endereco_params) }
        }.to_not change(Cidadao, :count)
      end
    end
  end

  describe 'GET #edit' do
    let(:cidadao) { create(:cidadao) }

    before { get :edit, params: { id: cidadao.id } }

    it 'validate status' do
      expect(response).to have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to render_template(:edit)
    end

    it 'validate object' do
      expect(assigns(:cidadao)).to eql cidadao
    end
  end

  describe 'PUT/PACTH #update' do
    let(:cidadao) { create(:cidadao) }

    context 'when cidadao have valid params', aggregate_failures: true do
      let(:cidadao_params) { attributes_for(:cidadao, nome_completo: 'Julia Fachin', data_nascimento: '1999-10-27'.to_date ) }
      it 'validate update object' do
        put :update, params: { id: cidadao.id, cidadao: cidadao_params }

        expect(cidadao.reload.nome_completo).to eq 'Julia Fachin'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to cidadaos_path
        expect(flash[:notice]).to eq 'Atualizado com sucesso!'
      end
    end

    context 'when cidadao do not have valid params' do
      let(:cidadao_params) { attributes_for(:cidadao, nome_completo: '', cpf: '' ) }
      it 'validate update object' do
        put :update, params: { id: cidadao.id, cidadao: cidadao_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
