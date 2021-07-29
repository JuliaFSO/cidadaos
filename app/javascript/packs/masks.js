$(document).ready(function () {
    Inputmask({ "mask": "999.999.999-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#cidadao_cpf');
    Inputmask({ "mask": "999 9999 9999 9999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#cidadao_cns');
    Inputmask({ "mask": "+55(99)99999-9999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.telefone-masked');
    Inputmask({ "mask": "99999-999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#cidadao_endereco_attributes_cep');
});
