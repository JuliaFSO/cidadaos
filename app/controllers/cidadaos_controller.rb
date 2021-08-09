class CidadaosController < ApplicationController
	  before_action :set_cidadao, only: [:show, :edit, :update]

  def index
    @cidadaos = Cidadao.order('nome_completo').all
  end

  def show
    @endereco = @cidadao.endereco
  end

  def new
    @cidadao = Cidadao.new
    @cidadao.build_endereco
  end

  def create
    @cidadao = Cidadao.new(cidadao_params)
     respond_to do |format|
      if @cidadao.save
        format.html { redirect_to cidadao_path(@cidadao), notice: t('messages.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cidadao.update(cidadao_params)
        format.html { redirect_to cidadao_path(@cidadao), notice: t('messages.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cidadao
    @cidadao = Cidadao.find(params[:id])
  end

  def cidadao_params
    params.require(:cidadao).permit(:nome_completo, :cpf, :cns,:email, :data_nascimento, :telefone, :foto, :status, endereco_attributes: [:id, :cep, :logradouro, :complemento, :bairro, :cidade, :uf])
  end

end
