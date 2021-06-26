<?php
$target_dir = "../uploads/";
include '../config/config.php';

$request = 1;
if (isset($_POST['request'])) {
	$request = $_POST['request'];
}
$post_id = (isset($_POST['post'])) ? intval($_POST['post']) : 0;

if ($request == 1) {
	$newFileName = uniqid('uploaded-', true) 
    . '.' . strtolower(pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION));
	$target_file = $target_dir . $newFileName;

	$msg = "";
	if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_dir . $newFileName)) {
		$sql = "INSERT INTO `posts_gallery`(`gallery_image`,`post_id`) VALUES('$newFileName','$post_id')";
		mysqli_query($conn, $sql);
		$msg = "Successfully uploaded";
	} else {
		$msg = "Error while uploading";
	}
	echo $msg;
}

// Remove file
// if ($request == 2) {
// 	$filename = $target_dir . $_POST['name'];
// 	$sql = "DELETE FROM `posts_gallery` WHERE `gallery_image`='$filename'";
// 	mysqli_query($conn, $sql);
// 	unlink($filename);
// 	exit;
// }

// $newFileName = uniqid('uploaded-', true) 
//     . '.' . strtolower(pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION));
// move_uploaded_file($_FILES['file']['tmp_name'], 'folder/' . $newFileName);
// $q = mysqli_query($con, "UPDATE users SET date=now(), image = '".$newFileName."' WHERE username= '$id'");
