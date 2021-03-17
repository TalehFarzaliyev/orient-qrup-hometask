<?php
    //n uzunluqda bir massiv düzəldin və içərisinə özünüz istənilən elementlər daxil edin (rəqəmlər) və bu massivin minimum və maximum-nu tapın
    
    $ededler = [-7, 20, 11.12454, -74, 24, -9, 14, -5, 21, 10, -48];
    $max = $ededler[0];
    $min = $ededler[0];

    foreach ($ededler as $value) {

        if($value > $max){
            $max = $value;
        }
        
        if($value < $min){
            $min = $value;
        }
    }

    echo "Ən böyük ədəd: $max </br> Ən kiçik ədəd: $min </br>";
?>