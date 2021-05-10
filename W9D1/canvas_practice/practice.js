document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.heigth =500;
    canvas.width =500;
    
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'lightblue';
    ctx.fillRect(0,0,500,500);
    ctx.beginPath();
    ctx.arc(350,80,50,0,2*Math.PI);
    ctx.strokeStyle ="red";
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle="orange";
    ctx.fill();
});
