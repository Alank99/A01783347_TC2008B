console.log("hello world");
//no var es malo
//funcion 1
function char_sin_repetir(string){
    const dict =
    {

    }

    for(let cha of string){
        dict[cha] =(dict[cha] || 0) + 1;
    }

    for(let cha of string){
        if(dict[cha] ==1){
            return cha;
        }
    }
}

//funcion 2
function bubble_sort(list_num){
    const long= list_num.length - 1;
    for(let i = 0; i < long; i++){
        for(let j = 0; j< long; j++){
            if(list_num[j] > list_num[j+1]){
                let temp = list_num[j];
                list_num[j] = list_num[j+1]
                list_num[j+1] = temp
            }
        }
    }
    return list_num;
}

//funcion 3.0
function invertido(list){
    let list_new=[];
    const len = list.length -1;
    for(let i = len ; i >= 0; i--){
        list_new.push(list[i])
    }
    return list_new;
}

//funcion 3.1
function invertido2(list){
    let n = list.length;
    for (let i = 0; i < n / 2; i++) {
      [list[i], list[n - i - 1]] = [list[n - i - 1], list[i]];
    }
    return list
}

function mayuscula(string){
    let new_string = [];
    new_string.push(string[0].toUpperCase());
    let sig_char = false;
    for(let i = 0; i < string.length; i++){

        if(string[i] == " "){
            new_string.push(string[i+1].toUpperCase());
            sig_char = true;
        }
        
        if(sig_char == false){
            new_string.push(string[i+1]);
        }
        sig_char = false;
    } 
    return new_string.join("");
}

function MCD(a,b){
    let temp = 0;
    while(b !== 0){
        temp = a % b;
        a = b;
        b = temp;
    }
    return a;
}

function hackspeech(string){
    const cambio ={
        "a": "4",
        "e": "3",
        "i": "1",
        "o": "0",
        "s": "5",
        "t": "7"
    };
    let new_string = "";
    let char = "";
    for(let i = 0; i < string.length; i++){
        char=string[i];
        if(char.toLowerCase() == "a" || char.toLowerCase() == "e" ||char.toLowerCase() == "i"||char.toLowerCase() == "o"
        || char.toLowerCase() == "s" || char.toLowerCase() == "t"){
            new_string += cambio[char.toLowerCase()];
        }
        else{
            new_string += char;
        }
    }
    return new_string;
}

function fatorizacion(n){
    let factores = [];
    for(let i = n; i > 0; i--){
        if(n % i == 0){
            factores.unshift(i);
        }
    }
    return factores;
}

function quitar_duplicados(list){
    const new_list = [];
    for(let i = 0; i<list.length; i++){
        if(new_list.indexOf(list[i]) == -1){
            new_list.push(list[i]);
        }
    }
    return new_list;
}

function min_list(list_string){
    let minimo = 0;
    for(let i = 0; i <list_string.length; i++){
        if( i == 0){
            minimo = list_string[i].length;
        }
        else if(minimo > list_string[i].length){
            minimo = list_string[i].length;
        }
    }
    return minimo;
}

function palindromo(string){
    let comparacion = string;
    comparacion_list = comparacion.split('');
    comparacion_list =invertido(comparacion_list);
    comparacion = comparacion_list.join("");
    if(string == comparacion){
        console.log("Si es un palindromo");
    }
    else{
        console.log("No es un palindromo")
    }

}

function orden_alfabetico(list_string){
    let listaOrdenada = [];
    while (list_string.length > 0) {
      let menor = list_string[0];
      for (let i = 1; i < list_string.length; i++) {
        if (list_string[i] < menor) {
          menor = list_string[i];
        }
      }
      listaOrdenada.push(menor);
      list_string.splice(list_string.indexOf(menor), 1);
    }
    return listaOrdenada;
}

function mediana_moda(list_num){
    let moda = repiticiones(list_num);
    let list_num_ord = bubble_sort(list_num);
    if(list_num_ord.length % 2 == 0){
        let num1 =list_num_ord[(list_num_ord.length/2)-1];
        let num2 = list_num_ord[(list_num_ord.length/2)];
        let mediana = (num1 + num2)/2
        return("la moda es " +moda+"\nmediana es "+mediana);
    }
    else{
        return("la moda es " +moda+"\nmediana es "+list_num_ord[(list_num_ord.length-1)/2]);
    }
    
}

function repiticiones(list){
    const contador =
    {

    }
    let max = 0;
    for(let i of list){
        contador[i] =(contador[i] || 0) + 1;
        if(contador[i] > max){
            max= contador[i];
        }
    }
    for( let i of list){
        if(contador[i] === max){
            return i;
        }
    }
}

function potencia_de_2(num){
   let si_pot2 = false;
   while (num > 1){
        if(num % 2 == 0){
            num = num/2;
            si_pot2 = true;
        }
        else{
            si_pot2 = false;
            break;
        }
   }
   if(si_pot2){
    return si_pot2;
   }
   else{
    return si_pot2;
   }
}

function bubble_sort_invertido(list_num){
    const long= list_num.length - 1;
    for(let i = 0; i < long; i++){
        for(let j = 0; j< long; j++){
            if(list_num[j] < list_num[j+1]){
                let temp = list_num[j];
                list_num[j] = list_num[j+1]
                list_num[j+1] = temp
            }
        }
    }
    return list_num;
}
console.log(bubble_sort_invertido([1,8,2,7,6]));
console.log(mediana_moda([12,10,9,12,11,12,8,12,5,7,2,3]));

console.log("3.1 Funcion que modifique el arreglo del argumento");
console.log(invertido([1, 2, 3, 4, 5]));

console.log(hackspeech("Javascript es divertido"));

console.log(fatorizacion(12));

palindromo("oro");