<?php
if ($_POST) {
    include("../config/config.php");

    $id = (int)$_POST['id'];
    $tableName = $_POST['tableName'];
    $status = (int)$_POST['status'];

    $sorgu = $conn->query("UPDATE $tableName SET `status`=$status WHERE id=$id");
}
?>
