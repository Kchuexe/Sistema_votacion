<?php
include "../modelo/conexion.php";
// Consultar los candidatos
$region=$_GET["id"];
$resultado = $conexion->query("select id, nombre from comunas where region_id='$region'");

// Crear un array con los datos
$datos = array();
while ($fila = $resultado->fetch_assoc()) {
    $datos[] = $fila;
}

// Devolver los datos en formato JSON
echo json_encode($datos);
?>