// Ottieni il riferimento al canvas e al contesto 2D
var canvas = document.getElementById("gioco");
var ctx = canvas.getContext("2d");

// Definisci le proprietà dell'uccellino
var bird = {
    x: 50,
    y: canvas.height / 2,
    radius: 20,
    color: "blue"
};

// Funzione per disegnare l'uccellino sul canvas
function drawBird() {
    ctx.beginPath();
    ctx.arc(bird.x, bird.y, bird.radius, 0, Math.PI * 2);
    ctx.fillStyle = bird.color;
    ctx.fill();
    ctx.closePath();
}

// Disegna l'uccellino
drawBird();