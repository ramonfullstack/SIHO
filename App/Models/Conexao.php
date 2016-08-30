<?php

/**
 * Created by PhpStorm.
 * User: Ramon
 * Date: 29/08/2016
 * Time: 23:42
 */
class Conexao
{

    $servername = "localhost";
    $username = "root";
    $password = "";

    $conn = new mysqli();


    public function conectar()
    {
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        else
        {

        }
        echo "Conexão bem sucedida";

    }

    public encerraConexao()
    {
        $conn->close();
    }



}