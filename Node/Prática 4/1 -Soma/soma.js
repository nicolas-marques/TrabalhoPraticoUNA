function sum(){
    var numero1 = document.querySelector(".numero1").value;
    var numero2 = document.querySelector(".numero2").value;

    var resultado = parseInt(numero1) + parseInt(numero2);
    document.querySelector(".resultado").innerHTML = resultado;
}