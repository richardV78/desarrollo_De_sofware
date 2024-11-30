function loguear() {
    let user = document.getElementById("username").value;
    let pass = document.getElementById("password").value;

    if (user === "1234" && pass == "1234") {
        window.location = "principalpage.html"; // Redirigir a la página principal
    } else {
        alert("Datos incorrectos");
    }
    
// Agregar el event listener al formulario
document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevenir el envío del formulario
    loguear(); // Llamar a la función de logueo
});
}