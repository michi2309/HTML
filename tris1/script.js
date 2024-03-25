var turno="X";
function scelta(id_casella)
{
    var suono1 = new Audio("./beep.mp3")
    var tag= document.getElementById(id_casella);
    if(tag.innerHTML==""){
        tag.innerHTML =turno;
        suono1.play();
        turno == "X" ? turno = "O": turno = "X";}
}