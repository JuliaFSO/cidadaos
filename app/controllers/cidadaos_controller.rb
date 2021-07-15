class CidadaosController < ApplicationController
	  before_action :set_cidadao, only: [:show, :edit, :update]

  def index
    @cidadaos = Cidadao.all
  end

  def show 
  end

  def new
    @cidadao = Cidadao.new
  end

  def create
    @cidadao = Cidadao.new(cidadao_params)
    @cidadao.save
    redirect_to cidadao_path(@cidadao)
  end

  def edit
  end

  def update
  end

  private

  def set_cidadao
    @cidadao = Cidadao.find(params[:id])
  end

  def cidadao_params
    params.require(:cidadao).permit(:nome_completo, :cpf, :email, :data_nascimento, :telefone, :photo, :status)
  end
end
