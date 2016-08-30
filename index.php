
<?php require_once "App/Views/cabecalho.php"; ?>
    <div class="container-fluid">
        <img src="pacotes/bootstrap/img/cab4.jpg" class="img-responsive">
        <div class="container-fluid">
            <form class="row">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Usuário</label>
            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Senha</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
        </div>
        <label>
            <a href="App/Views/Cadastros/cadastroUsuario.php" class="alert-info">Cadastre-se</a>
            <button type="submit" class="btn btn-default">Entrar</button>
            </form>

        </label>

        <div class="col-md-offset-10">
            <a href="#" class="alert-link">Administrador</a>
        </div>
    </div>
<?php require_once "App/Views/rodape.php" ?>