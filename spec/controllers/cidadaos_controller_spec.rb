RSpec.describe CidadaosController do
  let!(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:cidadaos) { create_list(:cidadao, 5) }

    before { get :index }

    it 'validar status' do
      expect(response).to  have_http_status(:success)
    end

    it 'validar render template' do
      expect(response).to  render_template(:index)
    end

    it 'validar lista cidadaos' do
      expect(assigns(:cidadaos).filtered_cidadaos).to eq cidadaos
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'validar status' do
      expect(response).to have_http_status(:success)
    end

    it 'validar render template' do
      expect(response).to render_template(:new)
    end

    it 'validar novo objeto' do
      expect(assigns(:cidadao)).to be_a_new(Cidadao)
    end
  end

  describe 'POST #create' do
    let(:cidadao_params) { attributes_for(:cidadao, data_nascimento: '2001-06-06'.to_date) }
    let(:endereco_params) { attributes_for(:endereco) }

    context 'Quando cidadao tem params validos', aggregate_failures: true do
      it 'validar objeto criado' do
        expect{
          post :create, params: { cidadao: cidadao_params.merge!(endereco_attributes: endereco_params) }
        }.to change(Cidadao, :count)
      end

      it 'validar status' do
        post :create, params: { cidadao: cidadao_params.merge!(endereco_attributes: endereco_params) }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to cidadaos_path
        expect(flash[:notice]).to eq 'Incluido com sucesso!'
      end
    end

    context 'Quando cidadao tem params invalidos' do
      it 'validar objeto criado' do
        expect{
          post :create, params: { cidadao: { nome_completo: 'Julia Fachin', data_nascimento: Date.tomorrow}.merge!(endereco_attributes: endereco_params) }
        }.to_not change(Cidadao, :count)
      end
    end
  end

  describe 'GET #edit' do
    let(:cidadao) { create(:cidadao) }

    before { get :edit, params: { id: cidadao.id } }

    it 'validar status' do
      expect(response).to have_http_status(:success)
    end

    it 'validar render template' do
      expect(response).to render_template(:edit)
    end

    it 'validar objeto' do
      expect(assigns(:cidadao)).to eql cidadao
    end
  end

  describe 'PUT/PACTH #update' do
    let(:cidadao) { create(:cidadao) }

    context 'Quando cidadao tem params validos', aggregate_failures: true do
      let(:cidadao_params) { attributes_for(:cidadao, nome_completo: 'Julia Fachin', data_nascimento: '1981-10-26'.to_date ) }
      it 'validar atualizacao do objeto' do
        put :update, params: { id: cidadao.id, cidadao: cidadao_params }

        expect(cidadao.reload.nome_completo).to eq 'Julia Fachin'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to cidadaos_path
        expect(flash[:notice]).to eq 'Atualizado com sucesso!'
      end
    end

    context 'Quando cidadao tem params invalidos' do
      let(:cidadao_params) { attributes_for(:cidadao, nome_completo: '', cpf: '' ) }
      it 'validar atualizacao do objeto' do
        put :update, params: { id: cidadao.id, cidadao: cidadao_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
