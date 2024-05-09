var canvas = document.getElementById("gameCanvas");
var ctx = canvas.getContext("2d");
var bird = {
    x: 50,
    y: canvas.height / 2,
    radius: 20,
    color: "blue",
    velocityY: 0 // Velocità verticale iniziale dell'uccellino
};
var gravity = 0.5; // Gravità iniziale
var jumpForce = -10; // Forza del salto
var jumpDamping = 0.9; // Coefficiente di smorzamento del salto
var obstacles = []; // Array per gli ostacoli
var obstacleSpeed = 2; // Velocità degli ostacoli
var obstacleWidth = 50; // Larghezza degli ostacoli
var gapHeight = 200; // Altezza del varco tra gli ostacoli
var obstacleDistance = 300; // Distanza orizzontale tra gli ostacoli
var gapSize = 100; // Dimensione del varco tra gli ostacoli
var minHeight = 50; // Altezza minima degli ostacoli
var maxHeight = canvas.height - gapHeight - minHeight; // Altezza massima degli ostacoli

function drawBird() {
    ctx.beginPath();
    ctx.arc(bird.x, bird.y, bird.radius, 0, Math.PI * 2);
    ctx.fillStyle = bird.color;
    ctx.fill();
    ctx.closePath();
}

function jump() {
    bird.velocityY = jumpForce; // Applica la forza del salto all'uccellino
}

function createObstacle() {
    var gapPosition = Math.random() * (canvas.height - gapHeight); // Posizione casuale del varco
    var obstacle = {
        x: canvas.width,
        y: 0,
        gapY: gapPosition,
        color: "green"
    };
    obstacles.push(obstacle);
}

function drawObstacles() {
    for (var i = 0; i < obstacles.length; i++) {
        var obstacle = obstacles[i];
        ctx.beginPath();
        ctx.rect(obstacle.x, 0, obstacleWidth, obstacle.gapY);
        ctx.fillStyle = obstacle.color;
        ctx.fill();
        ctx.closePath();
        
        ctx.beginPath();
        ctx.rect(obstacle.x, obstacle.gapY + gapHeight, obstacleWidth, canvas.height - (obstacle.gapY + gapHeight));
        ctx.fillStyle = obstacle.color;
        ctx.fill();
        ctx.closePath();
    }
}

function update() {
    // Applica la gravità
    bird.velocityY += gravity;
    
    // Applica il movimento verticale all'uccellino
    bird.y += bird.velocityY;
    
    // Genera nuovi ostacoli
    if (obstacles.length === 0 || canvas.width - obstacles[obstacles.length - 1].x > obstacleDistance) {
        createObstacle();
    }
    
    // Muovi gli ostacoli
    for (var i = 0; i < obstacles.length; i++) {
        obstacles[i].x -= obstacleSpeed;
    }
    
    // Rimuovi gli ostacoli che escono dallo schermo
    if (obstacles.length > 0 && obstacles[0].x + obstacleWidth < 0) {
        obstacles.shift();
    }
    
    // Controlla il limite inferiore del canvas per l'uccellino
    if (bird.y + bird.radius > canvas.height) {
        bird.y = canvas.height - bird.radius;
        bird.velocityY = 0;
    }
    
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBird();
    drawObstacles();
    requestAnimationFrame(update);
}

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
window.addEventListener("resize", function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    bird.y = canvas.height / 2;
    maxHeight = canvas.height - gapHeight - minHeight;
});

document.addEventListener("keydown", function(event) {
    if (event.keyCode === 32) {
        jump();
    }
});

update();
