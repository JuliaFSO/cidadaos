$(document).ready(function () {
  $('.cep').on('blur', function () {
    let cep = this.value;
    let url = `https://viacep.com.br/ws/${$('.cep').val()}/json/`;
    if (cep.length < 8)
      return
      $.ajax({
        url: url,
        dataType: 'json',
        type: 'GET',
        success: function (response, status) {
          if (status == "success") {
            $("#cidadao_endereco_attributes_logradouro").val(response.logradouro);
            $("#cidadao_endereco_attributes_bairro").val(response.bairro);
            $("#cidadao_endereco_attributes_cidade").val(response.localidade);
            $("#cidadao_endereco_attributes_uf").val(response.uf);
          } else {
            clearFields();
          }
        }
      });
    });
});

function clearFields() {
  $('#cidadao_endereco_attributes_logradouro')[0].value = '';
  $('#cidadao_endereco_attributes_bairro')[0].value = '';
  $('#cidadao_endereco_attributes_cidade')[0].value = '';
  $('#cidadao_endereco_attributes_uf')[0].value = '';
}