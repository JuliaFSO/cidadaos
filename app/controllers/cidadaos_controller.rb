class CidadaosController < ApplicationController
	  before_action :set_cidadao, only: [:show, :edit, :update]

  def index
    @cidadaos = Cidadao.all
  end

  def show
    @endereco = Endereco.new
  end

  def new
    @cidadao = Cidadao.new
  end

  def create
    @cidadao = Cidadao.new(cidadao_params)
    if @cidadao.save
      redirect_to new_cidadao_endereco_path(@cidadao)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cidadao.update(cidadao_params)
      redirect_to cidadao_path(@cidadao)
    else
      render :edit
    end
  end

  private

  def set_cidadao
    @cidadao = Cidadao.find(params[:id])
  end

  def cidadao_params
    params.require(:cidadao).permit(:nome_completo, :cpf, :email, :data_nascimento, :telefone, :foto, :status)
  end
end
