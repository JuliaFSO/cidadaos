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

  private

  def enderecos_params
    params.require(:endereco).permit(:cep, :logradouro, :bairro, :cidade, :uf)
  end
end
