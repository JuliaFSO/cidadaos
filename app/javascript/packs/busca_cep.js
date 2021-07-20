const url = 'viacep.com.br/ws/';
const form = document.getElementById("cep");
const h2 = document.getElementById("coordinates");

form.addEventListener("submit", (event) => {
    event.preventDefault();
    const coordinates = document.getElementById("address").value;
    fetch(`${url}${coordinates}.json?access_token=${apiKey}`)
        .then(response => response.json())
        .then((data) => {
            const longitude = data.features[0].center[0];
            const latitude = data.features[0].center[1];
            h2.innerText = `Longitude: ${longitude} | Latitude:${latitude}`;
});