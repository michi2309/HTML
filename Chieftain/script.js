var canvas = document.getElementById("gameCanvas");
var ctx = canvas.getContext("2d");
var bird = {
    x: 400,
    y: canvas.height / 2,
    radius: 20,
    color: "blue",
    velocityY: 0 // Velocità verticale iniziale dell'uccellino
};
var gravity = 0.2; // Gravità iniziale
var jumpForce = -10; // Forza del salto
var jumpDamping = 0.9; // Coefficiente di smorzamento del salto
var obstacles = []; // Array per gli ostacoli
var obstacleSpeed = 2; // Velocità degli ostacoli
var obstacleWidth = 50; // Larghezza degli ostacoli
var gapHeight = 300; // Altezza del varco tra gli ostacoli
var obstacleDistance = 300; // Distanza orizzontale tra gli ostacoli
var gapSize = 100; // Dimensione del varco tra gli ostacoli
var minHeight = 50; // Altezza minima degli ostacoli
var maxHeight = canvas.height - gapHeight - minHeight; // Altezza massima degli ostacoli
var isGameOver = false; // Flag per indicare se il gioco è terminato
var birdImage = new Image();
var obstacleImage = new Image();
var score = 0; // Punteggio iniziale
var scoreColor = "black"; // Colore del testo del punteggio
var scoreFontSize = 30; // Dimensione del testo del punteggio

birdImage.src = "bird.webp";
obstacleImage.src = "fv4005.jpg";

function drawBird() {
    ctx.drawImage(birdImage, bird.x - bird.radius, bird.y - bird.radius, bird.radius * 2, bird.radius * 2);
}

function drawObstacles() {
    for (var i = 0; i < obstacles.length; i++) {
        var obstacle = obstacles[i];
        ctx.drawImage(obstacleImage, obstacle.x, 0, obstacleWidth, obstacle.gapY);
        ctx.drawImage(obstacleImage, obstacle.x, obstacle.gapY + gapHeight, obstacleWidth, canvas.height - (obstacle.gapY + gapHeight));
    }
}

function drawScore() {
    ctx.fillStyle = scoreColor;
    ctx.font = scoreFontSize + "px Arial";
    ctx.fillText("Score: " + score, 10, 50); // Posizione del punteggio sullo schermo
}

function jump() {
    if (!isGameOver) {
        bird.velocityY = jumpForce; // Applica la forza del salto all'uccellino
    }
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

function checkCollision() {
    // Controlla la collisione con il limite superiore del canvas
    if (bird.y - bird.radius < 0) {
        isGameOver = true;
        return;
    }
    
    for (var i = 0; i < obstacles.length; i++) {
        var obstacle = obstacles[i];
        if (
            bird.x + bird.radius > obstacle.x &&
            bird.x - bird.radius < obstacle.x + obstacleWidth &&
            (bird.y - bird.radius < obstacle.gapY || bird.y + bird.radius > obstacle.gapY + gapHeight)
        ) {
            isGameOver = true;
            return;
        }
    }
}

function update() {
    if (!isGameOver) {
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
            isGameOver = true;
        }

        // Controlla le collisioni con gli ostacoli
        checkCollision();

        // Incrementa il punteggio quando l'uccellino supera un ostacolo
        if (obstacles.length > 0 && obstacles[0].x + obstacleWidth < bird.x - bird.radius) {
            score++;
        }
    }

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBird();
    drawObstacles();
    drawScore();

    if (!isGameOver) {
        requestAnimationFrame(update);
    } else {
        window.location.href = "main.html";
    }
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
