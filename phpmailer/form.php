<?php
include '../config/config.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'src/Exception.php';
require 'src/PHPMailer.php';
require 'src/SMTP.php';

$email   = $_POST['email'];
$name    = isset($_POST['name'])   ? $_POST['name']   : null;
$subject = isset($_POST['subject']) ? $_POST['subject'] : 'Mövzu';
$content = isset($_POST['content']) ? $_POST['content'] : null;

if (!$email) {
    if (isset($_POST['lang'])) {
        Header('Location:../../contact.php?error=email&lang=' . $_POST['lang'] . '');
    } else {
        Header('Location:../../contact.php?error=email');
    }
} elseif (!$content) {
    if (isset($_POST['lang'])) {
        Header('Location:../../contact.php?error=content&lang=' . $_POST['lang'] . '');
    } else {
        Header('Location:../../contact.php?error=content');
    }
} else {
    $mail = new PHPMailer(true);
    try {
        $mail->SMTPDebug  = 2;
        $mail->isSMTP();
        $mail->Host       = 'mail.saytweb.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'nrb@saytweb.com';
        $mail->Password   = 'ressamlarnrb';
        $mail->SMTPSecure = 'tls';
        $mail->Port       = 587;
        $mail->charset    = 'UTF-8';
        $mail->setlanguage('az');

        //Recipients
        $mail->setFrom('nrb@saytweb.com', 'Rəssamlar Birliyi');
        $mail->addAddress('nrb@saytweb.com');
        $mail->addReplyTo('nrb@saytweb.com', 'Rəssamlar Birliyi');

        $html = "Ad: $name <br> E-poçt: $email <br> Məzmun: $content";
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = $html;
        $mail->send();
        if (isset($_POST['lang'])) {
            Header('Location:../../contact.php?success=true&lang=' . $_POST['lang'] . '');
        } else {
            Header('Location:../../contact.php?success=true');
        }
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
}
