$(document).ready(function () {
    Inputmask({ "mask": "999.999.999-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cpf-masked');
    Inputmask({ "mask": "(99)99999-9999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.telefone-masked');
    Inputmask({ "mask": "99999-999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cep-masked');
});
