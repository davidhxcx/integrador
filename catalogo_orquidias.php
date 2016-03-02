<?php
        function __autoload($class_name){
            require_once 'class/' . $class_name . '.php';
        }

?>

<!DOCTYPE html>
<html>

<body>
    
    <?php
        
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

    if($img_orquidea == ''){
        echo"Selecione uma Imagem para a Orquidea!";
        return false;
    }else {

    if($desc_orquidea == ''){
        echo"Digite uma descrição para a Orquidea!";
        return false;
    }
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
<div>
	<div class="container-cadastro">
		<div id="cad_orquideas">       <!-- TITULO -->
				Cadastro de Orquideas
			</div>
			<div id="cad_curso">
		<form method="POST" action="">
            <input class="input-type" type="text" name="nome_orquidea" placeholder="Nome Popular da Orquidea">
            <input class="input-type" type="text" name="nm_cientifico" placeholder="Nome Cientifico da Orquidea"></br></p>
            <input class="input-type" type="img" name="img_orquidea">
			<input class="input-type" type="text" name="desc_orquidea" placeholder="Descrição da Orquidea"></br></p>
			<button type="submit" name="cadastrar" class="entrar-button">Cadastrar</button>
		</form>
			</br>
<table id="cad_curso_tabela" >
    
    <thead>
        <tr>
            <th>#</th>
            <th>Nome Popular:</th>
            <th>Nome Cientifico:</th>
            <th>Imagem:</th>
            <th>Descrição:</th>            
        </tr>
    </thead>

    <?php foreach($orquideas->findAll() as $key => $value): ?>
    
    <tbody>
        <tr>
            <td><?php echo $value->id; ?></td>
            <td><?php echo $value->nome_orquidea; ?></td>
            <td><?php echo $value->nm_cientifico; ?></td>
            <td><?php echo $value->img_orquidea; ?></td>
            <td><?php echo $value->desc_orquidea; ?></td>            
        </tr>
    </tbody>
    <?php endforeach; ?>
</table>
	</div>
</div>
</body>
			
</html>

