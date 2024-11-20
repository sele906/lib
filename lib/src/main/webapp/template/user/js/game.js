
var canvas = document.getElementById('gameCan');
var ctx = canvas.getContext('2d');

var animation;
var jumpingTime = 0;
var isAnimating = false;

var dino = {
        x: 10,
        y: 135,
        width: 20,
        height: 20,
        draw() {
            ctx.fillStyle = 'gray';
            ctx.fillRect(this.x, this.y, this.width, this.height);
        }
}

class Cactus {
    constructor() {
        this.x = 400;
        this.y = 120;
        this.width = 10;
        this.height = 30;
    }
    draw() {
        ctx.fillStyle = "gray";
        ctx.strokeRect(this.x, this.y, this.width, this.height);
    }
}

var timer = 0;
var cactusmix = [];

function byFrame() {
    animation = requestAnimationFrame(byFrame);
    timer++;
    
    ctx.clearRect(0,0, canvas.width, canvas.height);
    
    var rand = Math.floor(Math.random() * 21) + 150;
    
    if (timer % rand === 0) {
        var cactus = new Cactus();
        cactusmix.push(cactus);
    }

    cactusmix.forEach((a, i, o)=>{
        if (a.x < 0-a.width) {
            o.splice(i, 1);
        }
        a.x -= 2;
        a.draw(); 
        
        collision(dino, a);
    })
      
    if (jumping == true) {
        if (dino.y > 0) {
            dino.y -= 5;
        }
        dino.x = 11;
        dino.width = 18;
        jumpingTime++;
    }
    
    if (jumping == false) {
        if (dino.y < 135) {
            dino.y += 6;
        }
        dino.x = 10;
        dino.width = 20;
    }
    
    if (jumpingTime > 30) {
        jumping = false;
        jumpingTime = 0;
    }
    
    dino.draw();
}

var jumping = false;
document.addEventListener('keydown', function(e) {
    if (e.code === 'Space') {
        jumping = true;
    }
});

function collision(dino, cactus) {
    var xDifference = cactus.x - (dino.x + dino.width);
    var yDifference = cactus.y - (dino.y + dino.height);
    
    if (xDifference < 0 && yDifference < 0) {
        cancelAnimationFrame(animation);
        isAnimating = false;
    }
}

function play() {
    document.getElementById("simGame").style.display = "flex";
    
    if (!isAnimating) {
        isAnimating = true;
        byFrame();
    }
    
    document.getElementById("askGame").style.display = "none";
}







