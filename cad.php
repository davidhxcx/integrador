<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css\cad-css.css">
</head>


<body>

<?php

function __autoload($class_name){
            require_once 'class/' . $class_name . '.php';
        }
        
        $orquideas = new Orquideas();
        
        if(isset($_POST['cadastrar'])):
        
$nome_orquidea = $_POST['nome_orquidea'];
$nm_cientifico = $_POST['nm_cientifico'];
$img_orquidea = $_POST['img_orquidea'];
$desc_orquidea = $_POST['desc_orquidea'];

if($nome_orquidea == ''){
        echo"Digite o nome popular da Orquidea!";
        return false;
} else {

    if($nm_cientifico == ''){
        echo"Digite o nome cientifico da Orquidea!";
        return false;

    }else {

    if($desc_orquidea == ''){
        echo"Digite uma descrição para a Orquidea!";
        return false;
    }
}

}
 

    $orquideas->setNome($nome_orquidea);
    $orquideas->setCientifico($nm_cientifico); 
    $orquideas->setImagem($img_orquidea);
    $orquideas->setDescricao($desc_orquidea);

if($orquideas->insert()){
    echo "Orquidea Cadastrada com Sucesso!";
}

endif

    ?>

<div id="container">	
<div id="img_container">
	<div class="inputFile">
		<input type="file" class="upload" />
	</div>
</div>
	<div class="cad_orquideas">
		<form method="POST" action="">
            <input class="input-type" type="text" name="nome_orquidea" placeholder="Nome Popular da Orquidea"></br></p>
            <input class="input-type" type="text" name="nm_cientifico" placeholder="Nome Cientifico da Orquidea"></br></p>            
			<textarea rows="4" cols="50" class="input-type" type="text" name="desc_orquidea" placeholder="Descrição da Orquidea"></textarea></br></p>   
			<button type="submit" name="cadastrar" class="entrar-button">Cadastrar</button>
		</form>
	</div>
	</div>

</body>



</html>