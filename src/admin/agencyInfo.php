<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

use modules\auth\Admin as Auth;
use cruds\Admin as Cruds;

$auth = new Auth($db);
$cruds = new Cruds($db);

$auth->validate();

$id = $_GET['id'];

if (!isset($id)) {
    header('Location: agencies.php');
}

$agency = $cruds->getAgencyDetail($id);

$agency = json_decode($agency);

include dirname(__FILE__) . '/header.php';
?>

<body>


    <?php include dirname(__FILE__) . '/footer.php' ?>
