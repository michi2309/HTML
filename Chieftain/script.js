var canvas = document.getElementById("gameCanvas");
var ctx = canvas.getContext("2d");
var bird = {
    x: 50,
    y: canvas.height / 2,
    radius: 20,
    color: "blue"
};
var gravity = 2;
var obstacles = []; // Array per gli ostacoli
var obstacleSpeed = 2; // Velocità degli ostacoli
var obstacleWidth = 50; // Larghezza degli ostacoli
var gapHeight = 200; // Altezza del varco tra gli ostacoli

function drawBird() {
    ctx.beginPath();
    ctx.arc(bird.x, bird.y, bird.radius, 0, Math.PI * 2);
    ctx.fillStyle = bird.color;
    ctx.fill();
    ctx.closePath();
}

function jump() {
    bird.y -= 50;
}

function createObstacle() {
    var obstacle = {
        x: canvas.width,
        y: Math.random() * (canvas.height - gapHeight), // Posizione casuale dell'ostacolo
        width: obstacleWidth,
        color: "green"
    };
    obstacles.push(obstacle);
}

function drawObstacles() {
    for (var i = 0; i < obstacles.length; i++) {
        var obstacle = obstacles[i];
        ctx.beginPath();
        ctx.rect(obstacle.x, 0, obstacle.width, obstacle.y);
        ctx.fillStyle = obstacle.color;
        ctx.fill();
        ctx.closePath();
        
        ctx.beginPath();
        ctx.rect(obstacle.x, obstacle.y + gapHeight, obstacle.width, canvas.height - (obstacle.y + gapHeight));
        ctx.fillStyle = obstacle.color;
        ctx.fill();
        ctx.closePath();
    }
}

function update() {
    bird.y += gravity;
    
    // Genera nuovi ostacoli
    if (Math.random() < 0.02) { // Cambia questo valore per regolare la frequenza degli ostacoli
        createObstacle();
    }
    
    // Muovi gli ostacoli
    for (var i = 0; i < obstacles.length; i++) {
        obstacles[i].x -= obstacleSpeed;
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
});

document.addEventListener("keydown", function(event) {
    if (event.keyCode === 32) {
        jump();
    }
});

update();
