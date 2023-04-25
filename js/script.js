$(document).ready(function()
{
    obtener_region();
    obtener_comuna();
    obtener_candidato();
    insertar_voto();
})

function insertar_voto(){
    $(document).on('click','#btn_votar',function(){
        //Recopilamos los valores ingresados por el usuario en los campos del formulario
        var nombre = $('#nombre').val();
        var alias = $('#alias').val();
        var email= $('#email').val();
        var rut= $('#rut').val();
        var region= $('#region').val();
        var comuna= $('#comuna').val();
        var candidato= $('#candidato').val();
        var opcion1= $('#web').is(":checked");
        var opcion2= $('#tv').is(":checked");
        var opcion3= $('#redes-sociales').is(":checked");
        var opcion4= $('#amigos').is(":checked");
        // Inicializar una variable para almacenar las opciones seleccionadas
        var opciones_seleccionadas = "";

        // Concatenar las opciones seleccionadas en la variable opciones_seleccionadas
        if (opcion1) {
            opciones_seleccionadas += "Web, ";
        }
        if (opcion2) {
            opciones_seleccionadas += "TV, ";
        }
        if (opcion3) {
            opciones_seleccionadas += "Redes Sociales, ";
        }
        if (opcion4) {
            opciones_seleccionadas += "Amigos, ";
        }

        // Eliminar la última coma y el espacio sobrantes en la cadena
        opciones_seleccionadas = opciones_seleccionadas.slice(0, -2);
        //Los valores de todas las variables se envían como datos de solicitud POST en la solicitud AJAX
            $.ajax(
                {
                    url : '../DesarrolloJob/controlador/insertar.php',
                    method: 'post',
                    data:{INombre:nombre,IAlias:alias,IEmail:email,IRut:rut,IRegion:region,IComuna:comuna,ICandidato:candidato,IComentario:opciones_seleccionadas},
                    success: function(data)
                    {
                        $('#mensaje').html(data);
                        $('form').trigger('reset');
                    }
                })
    })
}

function obtener_region(){
    //
    var selectRegion = document.getElementById("region");
    //
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "../DesarrolloJob/controlador/obtenerRegiones.php", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Convertir la respuesta en un array de objetos
            var regiones = JSON.parse(xhr.responseText);

            // Agregar las opciones al select de regiones
            for (var i = 0; i < regiones.length; i++) {
                var option = document.createElement("option");
                option.value = regiones[i].id;
                option.textContent = regiones[i].nombre;
                selectRegion.appendChild(option);
            }
        }
    };
    xhr.send();
}

function obtener_comuna(){
    //Obtener los valores seleccionados
    var idRegion = document.getElementById("region").value;
    //Obtener el select de comunas
    var selectComuna = document.getElementById("comuna");
    //Vaciar el select de comunas
    selectComuna.innerHTML = "<option value=''>Seleccione una comuna</option>";
    //Si se ha seleccionado una región, cargar las comunas correspondientes
    if(idRegion != ""){
        // Realizar la petición Ajax al archivo PHP
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "../DesarrolloJob/controlador/obtenerComunas.php?id=" + idRegion, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Convertir la respuesta en un array de objetos
                var comunas = JSON.parse(xhr.responseText);

                // Agregar las opciones al select de comunas
                for (var i = 0; i < comunas.length; i++) {
                    var option = document.createElement("option");
                    option.value = comunas[i].id;
                    option.textContent = comunas[i].nombre;
                    selectComuna.appendChild(option);
                }
            }
        };
        xhr.send();
    }
}

function obtener_candidato(){
    // Obtener el select de candidatos
    var selectCandidato = document.getElementById("candidato");
    // Realizar la petición Ajax al archivo PHP
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "../DesarrolloJob/controlador/obtenerCandidatos.php", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Convertir la respuesta en un array de objetos
            var candidatos = JSON.parse(xhr.responseText);

            // Agregar las opciones al select de candidatos
            for (var i = 0; i < candidatos.length; i++) {
                var option = document.createElement("option");
                option.value = candidatos[i].ID;
                option.textContent = candidatos[i].NOMBRE;
                selectCandidato.appendChild(option);
            }
        }
    };
    xhr.send();
}

function validarCheckbox() {
    //Obtenemos los checkbos con el mismo nombre
    var checkboxes = document.getElementsByName("opciones");
    //Inicializa una variable que se utilizará para contar la cantidad de opciones seleccionadas
    var seleccionados = 0;
    //El ciclo for es usado para iterar sobre todos los checkboxes obtenidos. Si el checkbox actual está seleccionado, se incrementa el contador "seleccionados"
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        seleccionados++;
      }
    }
    //Verifica si el contador seleccionados es menor que dos
    if (seleccionados < 2) {
      alert("Debe seleccionar al menos dos opciones");
      return false;
    } else {
      return true;
    }
  }

  $(document).ready(function() {
    $('#rut').on('input', function() {
      var rut = $(this).val();
      // Validamos el RUT usando la función validarRut
      var valido = validarRut(rut);
      if (valido) {
        $('#mensaje').text('RUT válido').removeClass('error').addClass('valido');
      } else {
        $('#mensaje').text('RUT inválido').removeClass('valido').addClass('error');
      }
    });
  });
  // Función para validar el RUT
function validarRut(rut) {
    // Eliminamos los puntos y guiones del RUT
    rut = rut.replace(/[.-]/g, '');
    // Validamos que el RUT tenga un formato válido (sólo números y opcionalmente una letra K al final)
    if (!/^[0-9]+[0-9kK]{0,1}$/.test(rut)) {
      return false;
    }
    // Obtenemos el dígito verificador ingresado
    var dv = rut.slice(-1).toUpperCase();
    // Obtenemos el resto del RUT (sin el dígito verificador)
    var rest = rut.slice(0, -1);
    // Determinamos el factor multiplicativo según la cantidad de dígitos del resto del RUT
    var factor = rest.length === 8 ? 2 : 3;
    // Calculamos la suma ponderada de los dígitos del resto del RUT
    var sum = 0;
    for (var i = rest.length - 1; i >= 0; i--) {
      sum += parseInt(rest.charAt(i)) * factor;
      factor = factor === 7 ? 2 : factor + 1;
    }
    // Calculamos el dígito verificador esperado
    var expectedDv = 11 - (sum % 11);
    if (expectedDv === 11) {
      expectedDv = 0;
    } else if (expectedDv === 10) {
      expectedDv = 'K';
    }
    // Comparamos el dígito verificador esperado con el dígito verificador ingresado
    return expectedDv.toString() === dv;
  }
  
  $(document).ready(function() {
    // Agregamos un evento input al input #mi-input
    $('#alias').on('input', function() {
      // Obtenemos el valor del input #mi-input
      var valor = $(this).val();
      // Validamos que el valor contenga al menos una letra y un número, y que su longitud sea mayor a 5
      if (/^(?=.*[a-zA-Z])(?=.*\d).{6,}$/.test(valor)) {
        // Si el valor es válido, habilitamos el botón
        $('#btn_votar').prop('disabled', false);
        $('#mensaje').text('').removeClass('error').addClass('valido');
      } else {
        // Si el valor es inválido, deshabilitamos el botón
        $('#btn_votar').prop('disabled', true);
        $('#mensaje').text('El valor debe contener al menos una letra y un número, y su longitud debe ser mayor a 5').removeClass('valido').addClass('error');
      }
    });
  });
  