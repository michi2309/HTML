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
// Aggiungi un listener per l'evento keydown per gestire il salto dell'uccellino
document.addEventListener("keydown", function(event) {
    // Se il tasto premuto è la barra spaziatrice (codice 32)
    if (event.keyCode === 32) {
        jump();
    }
});

// Funzione per far saltare l'uccellino
function jump() {
    bird.y -= 50; // Sposta l'uccellino verso l'alto
}

// Definisci la costante di gravità
var gravity = 2;

// Funzione per aggiornare il gioco ad ogni frame
function update() {
    // Aggiungi la gravità all'uccellino per farlo scendere
    bird.y += gravity;
    
    // Pulisci il canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    // Disegna l'uccellino
    drawBird();
    
    // Richiama la funzione update() ad ogni frame
    requestAnimationFrame(update);
}

// Avvia il gioco
update();
