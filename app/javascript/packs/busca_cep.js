$('.cep').on('blur',()=>{
  let url = `https://viacep.com.br/ws/${$('.cep').val()}/json/`;
  $.ajax({
    url: url,
    dataType: 'json',
    type: 'GET',
    success: function (response) {
      $("#logradouro").val("...");
      $("#bairro").val("...");
      $("#cidade").val("...");
      $("#uf").val("...");
      $("#ibge").val("...");
    }
  });
})
