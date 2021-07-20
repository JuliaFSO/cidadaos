class EnderecosController < ApplicationController

  def new
    @cidadao = Cidadao.find(params[:cidadao_id])
    @endereco = Endereco.new
  end

  def create
    @cidadao = Cidadao.find(params[:cidadao_id])
    @endereco = Endereco.new(endereco_params)
    @endereco.cidadao = @endereco

    if @endereco.save
      redirect_to cidadao_path(@cidadao)
    else
      render 'cidadaos/show'
    end
  end

  def edit
    @endereco = Endereco.find(params[:id])
  end

  def update
    @endereco = Endereco.find(params[:id])

    if @endereco.update(endereco_params)
      redirect_to cidadao_path(@endereco.cidadao)
    else
      render :edit
    end
  end

  private

  def set_endereco
    @endereco = Endereco.find(params[:id])
  end

  def endereco_params
    params.require(:endereco).permit(:cep, :logradouro, :bairro, :cidade, :uf)
  end
end
