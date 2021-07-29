var input = document.querySelector("#cidadao_telefone");
window.intlTelInput(input, {
    initialCountry: "auto",
    geoIpLookup: function (callback) {
        $.get('https://ipinfo.io', function () { }, "jsonp").always(function (resp) {
            var countryCode = (resp && resp.country) ? resp.country : "BR";
            callback(countryCode);
        });
    },
    utilsScript: "../../build/js/utils.js?<%= time %>" // just for formatting/placeholders etc
});