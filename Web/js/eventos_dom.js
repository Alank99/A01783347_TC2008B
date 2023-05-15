
//Ejercicio 1
document.addEventListener('DOMContentLoaded', function() {
    const posicionElemento = document.getElementById('mousePosition'); // Referencia al elemento donde se mostrará la posición
  
    function actualizarPosicion(evento) {
      const x = evento.clientX; // Posición X del mouse
      const y = evento.clientY; // Posición Y del mouse
      posicionElemento.textContent = `Posición del mouse: X=${x}px, Y=${y}px`; // Actualiza el contenido con la posición del mouse
    }
  
    document.addEventListener('mousemove', actualizarPosicion); // Agrega un evento para escuchar el movimiento del mouse
  });

  
//Ejercicio 2
document.getElementById("form1-submit").addEventListener("click", function(event) {
    event.preventDefault(); // Prevenir el envío del formulario por defecto del navegador
  
    const firstName = document.getElementById("form-fname").value; // Obtener el valor del input con id formChat-fname
    const lastName = document.getElementById("form-lname").value; // Obtener el valor del input con id formChat-lname
    const fullName = firstName + " " + lastName; // Combinar el nombre y el apellido para obtener el nombre completo
  
    const fullNameElement = document.createElement("p"); // Crear un elemento <p> para mostrar el nombre completo
    fullNameElement.innerHTML = "Nombre completo: " + fullName; // Establecer el contenido del elemento con el nombre completo
  
    document.getElementById("form1").appendChild(fullNameElement); // Agregar el elemento del nombre completo al formulario con id formChatGPT
});


//Ejercicio 3
// Agregar event listener al botón "Insert row" para llamar a la función agregarFila() al hacer clic
document.getElementById("btn-insert-r").addEventListener("click", agregarFila);
document.getElementById("btn-insert-c").addEventListener("click", agregarColumna);

function agregarFila() {
  const tabla = document.getElementById("sampleTable"); // Obtener la referencia de la tabla por su ID

  // Crear una nueva fila al final de la tabla
  const fila = tabla.insertRow(tabla.rows.length);

  // Obtener el número de columnas en la primera fila de la tabla
  const columnas = tabla.rows[0].cells.length;

  // Iterar sobre las columnas para agregar una celda en cada una
  for (let i = 0; i < columnas; i++) {
    const celda = fila.insertCell(i); // Insertar una nueva celda en la fila
    celda.innerHTML = "New row" + (i + 1); // Establecer el contenido de la celda
  }
}

function agregarColumna() {
  const tabla = document.getElementById("sampleTable"); // Obtener la referencia de la tabla por su ID

  // Iterar sobre las filas de la tabla
  for (let i = 0; i < tabla.rows.length; i++) {
    const fila = tabla.rows[i]; // Obtener la fila actual

    // Insertar una nueva celda al final de la fila
    const celda = fila.insertCell(fila.cells.length);

    // Establecer el contenido de la celda
    celda.innerHTML = "new column";
  }
}

//Ejercicio 4
// Agregar un evento 'click' al botón 'btn-change'
document.getElementById('btn-change').addEventListener('click', function() {
  // Obtener los valores de los campos de input y restar 1 para ajustar los índices a la tabla
  let rowIndex = parseInt(document.getElementById('rowIndex').value) - 1;
  let colIndex = parseInt(document.getElementById('colIndex').value) - 1;
  let newValue = document.getElementById('newValue').value;

  // Obtener la tabla y las filas
  let table = document.getElementById('myTable');
  let rows = table.getElementsByTagName('tr');

  // Verificar si el índice de fila es válido
  if (rowIndex >= 0 && rowIndex < rows.length) {
      // Obtener las celdas de la fila seleccionada
      let cells = rows[rowIndex].getElementsByTagName('td');

      // Verificar si el índice de columna es válido
      if (colIndex >= 0 && colIndex < cells.length) {
          // Actualizar el contenido de la celda con el nuevo valor
          cells[colIndex].innerText = newValue;
      } else {
          // Mostrar una alerta si el índice de columna es inválido
          alert('Invalid column index');
      }
  } else {
      // Mostrar una alerta si el índice de fila es inválido
      alert('Invalid row index');
  }
});

//Ejercicio 5 
// Esperar a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
  // Obtener elementos del DOM
  let colorSelect = document.getElementById('colorSelect');
  let btnAddColor = document.getElementById('btn-add-color');
  let btnRmvColor = document.getElementById('btn-rmv-color');

  // Función para convertir un número decimal a su representación hexadecimal de 2 dígitos
  function decimalToHex(decimal) {
      let hex = decimal.toString(16);
      return hex.length === 1 ? '0' + hex : hex;
  }

  // Manejador de evento para el botón de agregar color
  btnAddColor.addEventListener('click', function() {
      // Generar valores aleatorios para los componentes RGB
      let red = Math.floor(Math.random() * 256);
      let green = Math.floor(Math.random() * 256);
      let blue = Math.floor(Math.random() * 256);

      // Convertir los valores RGB a formato hexadecimal
      let hexColor = '#' + decimalToHex(red) + decimalToHex(green) + decimalToHex(blue);

      // Crear un nuevo elemento de opción
      let option = document.createElement('option');
      option.textContent = hexColor;
      option.style.backgroundColor = hexColor; // Establecer el color de fondo del elemento de opción

      // Agregar el nuevo elemento de opción al select
      colorSelect.appendChild(option);
  });

  // Manejador de evento para el botón de eliminar color
  btnRmvColor.addEventListener('click', function() {
      // Obtener el índice del elemento seleccionado
      let selectedIndex = colorSelect.selectedIndex;
      
      // Verificar si se seleccionó un elemento
      if (selectedIndex !== -1) {
          // Remover el elemento seleccionado
          colorSelect.remove(selectedIndex);
      }
  });
});

//Ejercicio 6

// Esperar a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
  // Obtener la imagen del DOM
  let imagenGato = document.getElementById('imagenGato');

  // Manejador de evento para cuando el mouse entra en la imagen
  imagenGato.addEventListener('mouseenter', function() {
      // Generar dos números aleatorios entre 300 y 600 para width y height
      let randomWidth = Math.floor(Math.random() * (600 - 300 + 1)) + 300;
      let randomHeight = Math.floor(Math.random() * (600 - 300 + 1)) + 300;

      // Crear la URL de la imagen con los tamaños aleatorios
      let imageUrl = 'http://placekitten.com/' + randomWidth + '/' + randomHeight;

      // Reemplazar la imagen de placeholder por la nueva imagen con tamaños aleatorios
      imagenGato.src = imageUrl;
  });
});
