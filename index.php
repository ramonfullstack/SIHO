
<?php require_once "App/Views/cabecalho.php"; ?>
<div class="container">
    <div class="container-fluid">
        <form class="row">
        <div class="col-md-6 col-md-offset-3">
		     <div class="form-group">
		         <label for="exampleInputEmail1">Usuário</label>
		         <input type="text" class="form-control" name="usuario" id="exampleInputEmail1" placeholder="Email">
		     </div>
		     <div class="form-group">
		         <label for="exampleInputPassword1">Senha</label>
		         <input type="password" class="form-control" name="senha" id="exampleInputPassword1" placeholder="Password">
		     </div>
		     <label>
		         <a href="App/Views/Cadastros/cadastroUsuario.php" class="alert-info">Cadastre-se</a>
		     </label>   
		         <input  type="submit" class="btn btn-default" value="Entrar">
		  </form>

	     <div class="col-md-offset-10">
	         <a href="#" class="alert-link">Administrador</a>
	     </div>
	</div>
</div>	
<?php require_once "App/Views/rodape.php" ?>
</body>