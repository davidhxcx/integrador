<?php
        function __autoload($class_name){
            require_once 'class/' . $class_name . '.php';
        }

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Modal</title>
	<link rel="stylesheet" href="css/cad-css.css">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="css\cad-css.css">

<script type="text/javascript"> //Jquery do MODAL

	$(document).ready(function(e) {
		$('.btn_modal').click(function() {
			$('#modal').fadeIn(500);

		});		

		$('#modal, .fechar').click(function(e) {
			if( e.target !== this )
				retun;
			$('#modal').fadeOut(500);
		});
	});

</script>

</head>


<body>
<h1>Cadastre Suas Orquideas!</h1></br>

<input type="button" value="Cadastrar Orquidea" class="btn_modal"/></br>

<table id="cad_orquidea" > <!--Table das Orquideas Cadastradas-->
    
    <thead>
        <tr>
            <th>#</th>
            <th>Nome Popular:</th>
            <th>Nome Cientifico:</th>
            <th>Imagem:</th>
            <th>Descrição:</th>                     
        </tr>
    </thead>

    <?php 
    $orquideas = new Orquideas;
    foreach($orquideas->findAll() as $key => $value): ?>
    
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
</table><!--Fim da Table das Orquideas Cadastradas-->

<div id="modal"><!--MODAL-->
	<div class="modal-box">
		<div class="moda-box-conteudo">
			
		</div>
		<div class="fechar">X</div>
		<div>
			<iframe src="cad.php" width="100%" height="300px"></iframe>
		</div>
	</div>
</div><!--FIM MODAL-->

</body>



</html>