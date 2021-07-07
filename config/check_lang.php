<?php
if (isset($_GET['lang'])) {
    if (!empty($_GET['lang'])) {
        $lang_id   = (!empty($lang_ids[$_GET['lang']])) ? $lang_ids[$_GET['lang']] : 1;
        $lang_name = (!empty($_GET['lang'])) ? $_GET['lang'] : 'az';
    } else {
        $lang_id   = 1;
        $lang_name = "az";
    }
} else {
    $lang_id   = 1;
    $lang_name = "az";
}
