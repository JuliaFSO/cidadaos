$('.cep').on('blur',()=>{
  let url = `https://viacep.com.br/ws/${$('.cep').val()}/json/`;
  $.ajax({
    url: url,
    dataType: 'json',
    type: 'GET',
    success: function (response) {
      $("#cidadao_endereco_attributes_logradouro").val("...");
      $("#cidadao_endereco_attributes_bairro").val("...");
      $("#cidadao_endereco_attributes_cidade").val("...");
      $("#cidadao_endereco_attributes_uf").val("...");

      $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

        if (!("erro" in dados)) {
          //Atualiza os campos com os valores da consulta.
          $("#cidadao_endereco_attributes_logradouro").val(dados.logradouro);
          $("#cidadao_endereco_attributes_bairro").val(dados.bairro);
          $("#cidadao_endereco_attributes_cidade").val(dados.cidade);
          $("#cidadao_endereco_attributes_uf").val(dados.uf);
        } //end if.
        else {
          //CEP pesquisado não foi encontrado.
          limpa_formulário_cep();
          alert("CEP não encontrado.");
        }
      });
    } //end if.
                    else {
      //cep é inválido.
      limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
    }
  } //end if.
                else {
      //cep sem valor, limpa formulário.
      limpa_formulário_cep();
    }
  });
})
