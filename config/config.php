<?php
    $username   =   'root';
    $host       =   'localhost';
    $password   =   '';
    $database   =   'orient_ressamlar';

    $conn       = mysqli_connect($host, $username, $password, $database,3306);
    include $_SERVER['DOCUMENT_ROOT'].'/config/vars.php';
    include $_SERVER['DOCUMENT_ROOT'].'/helpers/translation.php';

    if (mysqli_connect_errno()) {
        exit();
    }

    if (!mysqli_set_charset($conn, "utf8mb4")) {
        exit();
    } 

    if(!$conn)
    {
        echo "Disconnected";
    }