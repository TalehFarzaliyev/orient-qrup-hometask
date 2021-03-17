<?php
    //Massivinizin elementləri bu şəkildədir: -12, 11, -13, -5, 6, -7, 5, -3, -6 
    //bu elementləri mənfidən müsbətə doğru sıralayın ekrana bu nəticə çıxsın : -12 -13 -5 -7 -3 -6 11 6 5
    
    $ededler = [-12, 11, -13, -5, 6, -7, 5, -3, -6];
    $yeniededler = [];

    for($i = 0; $i < count($ededler); $i++){
        if($ededler[$i] < 0){
            $yeniededler[] = $ededler[$i];
            }
    }

    for($i = 0; $i < count($ededler); $i++){
        if($ededler[$i] > 0){
            $yeniededler[] = $ededler[$i];
            }
    }

    echo "<pre>"; print_r($yeniededler);
?>