$('.cep').on('blur',()=>{
  let url = `https://viacep.com.br/ws/${$('.cep').val()}/json/`;
  $.ajax({
    url: url,
    dataType: 'json',
    type: 'GET',
    success: function (response) {
      $("#cidadao_endereco_attributes_logradouro").val(`${response.logradouro}, nº `);
      $("#cidadao_endereco_attributes_bairro").val(response.bairro);
      $("#cidadao_endereco_attributes_cidade").val(response.localidade);
      $("#cidadao_endereco_attributes_uf").val(response.uf);

    }
  });
})
