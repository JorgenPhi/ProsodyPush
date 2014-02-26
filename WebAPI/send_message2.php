<?php

        include_once 'db_functions.php';
        $db = new DB_Functions();


if (isset($_GET["to"]) && isset($_GET["from"])) {

        $user = $db->getUserByEmail(mysql_real_escape_string($_GET["to"]));
        $row = mysql_fetch_array($user);

    $regId = $row["gcm_regid"];
    $message = $_GET["from"] . ": " . $_GET['body'];
    
    include_once './GCM.php';
    
    $gcm = new GCM();

    $registatoin_ids = array($regId);
    $message = array("price" => $message);

    $result = $gcm->send_notification($registatoin_ids, $message);

    echo $result;
}
?>
