<?php
    //a1, a2,..., an həqiqi ədədlər ardıcıllığı verilir. İndeksi 3-ə qalıqsız bölünən müsbət ədədlərin sayını və cəmini hesablayın.

    $ededler = [-7, 20, 6, 11.12454, 14, 24, -4, 14, -5, 21, 10, -40];
    
    //echo "<pre>"; print_r($ededler);

    $say = 0;
    $cem = 0;
    foreach ($ededler as $key => $value) {
        if(($key+1) % 3 == 0 && $value > 0){

            //echo "3-ə bölünən index $key => müsbət olan dəyəri $value </br>";

            $say += 1;
            $cem += $value;
        }
    }
    echo "Say: ". $say."</br> Cəm: ".round($cem, 2);
?>