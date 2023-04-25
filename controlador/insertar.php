<?php
include "../modelo/conexion.php";
    //Recibimos los datos enviados por la función ajax y verificamos que no estén vacíos
    if(!empty($_POST["INombre"]) and !empty($_POST["IAlias"]) and !empty($_POST["IEmail"]) and !empty($_POST["IRut"]) and !empty($_POST["IRegion"]) and !empty($_POST["IComuna"]) and !empty($_POST["ICandidato"]) and !empty($_POST["IComentario"])){
        $nombre=$_POST["INombre"];
        $Alias=$_POST["IAlias"];
        $email=$_POST["IEmail"];
        $rut=$_POST["IRut"];
        $region_id=$_POST["IRegion"];
        $comuna_id=$_POST["IComuna"];
        $candidato_id=$_POST["ICandidato"];
        $comentario=$_POST["IComentario"];
        //Hacemos un select para buscar que no este duplicado el rut
        $sql1 = "select * from votantes where rut='$rut'";
        //Guardamos el resultado
        $resultado = $conexion->query($sql1);
        //Verificamos si nos devolvio un resultadop o no
        if ($resultado->num_rows > 0){
            echo '<div> El rut ya se encuentra registrado</div>';
        }else{
            //En el caso de devolvernos un resultado, insertarmos en la base da datos
            $sql=$conexion->query("insert into votantes values(NULL,'$nombre','$Alias','$rut','$email','$region_id', '$comuna_id', '$candidato_id', '$comentario')");
            if($sql==1){
            
            echo '<div> Registro guardado</div>';
            }else{
            
            echo '<div> Error al insertar los datos</div>';
            }
        }
        //Cerramos la conexión
        $conexion->close();
    }else{
        echo '<div> Los campos no pueden estar vacios</div>';
    }
?>