<?php
$target_dir = "../uploads/";
include '../config/config.php';

$request = 1;
if (isset($_POST['request'])) {
	$request = $_POST['request'];
}
$post_id = (isset($_POST['post'])) ? intval($_POST['post']) : 0;

if ($request == 1) {
	$target_file = $target_dir . basename($_FILES["file"]["name"]);

	$msg = "";
	if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_dir . $_FILES['file']['name'])) {
		$sql = "INSERT INTO `posts_gallery`(`gallery_image`,`post_id`) VALUES('$target_file','$post_id')";
		mysqli_query($conn, $sql);
		$msg = "Successfully uploaded";
	} else {
		$msg = "Error while uploading";
	}
	echo $msg;
}

// Remove file
if ($request == 2) {
	$filename = $target_dir . $_POST['name'];
	$sql = "DELETE FROM `posts_gallery` WHERE `gallery_image`='$filename'";
	mysqli_query($conn, $sql);
	unlink($filename);
	exit;
}
