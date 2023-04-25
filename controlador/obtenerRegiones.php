<?php
include "../modelo/conexion.php";
// Consultar los candidatos
$resultado = $conexion->query("select * from regiones");

// Crear un array con los datos
$datos = array();
while ($fila = $resultado->fetch_assoc()) {
    $datos[] = $fila;
}

// Devolver los datos en formato JSON
echo json_encode($datos);
?>