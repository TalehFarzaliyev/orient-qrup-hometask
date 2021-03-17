<?php
    //n uzunluqda 1 massiv düzəldin və  içərisinə özünüz istənilən elementlər daxil edin (rəqəmlər). Bu massivi kiçikdən böyük-ə sıralayın

    $ededler = [47, 20, 74, 24, -4, 14, -5, 21, 10, -88];
    
    $max = $ededler[0];

    for($i = 0; $i < count($ededler); $i++){

        for($j = 1; $j < count($ededler); $j++){

            if($ededler[$j-1] > $ededler[$j]){

                $max = $ededler[$j-1];
                $ededler[$j-1] = $ededler[$j];
                $ededler[$j] = $max;
            }
        }
    }

    echo "<pre>"; print_r($ededler);
?>