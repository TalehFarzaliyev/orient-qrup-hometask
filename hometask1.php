<?php
    // Menim yazdığım
    // $a = ["G", "C", "V"];

    // for($i = 0; $i < 7; $i++){

    //     $m = [$a[0], $a[2], $a[1]]; //G V C
    //     $n = [$m[1], $m[0], $m[2]]; //V G C
    //     $a = [$n[0], $n[1], $n[2]]; 

    //     echo "$m[0]$m[1]$m[2]</br>";
    //     echo "$n[0]$n[1]$n[2]</br>";
       
    // }


    //Düzgün olan
    $day = 7;
    if($day % 3 == 1){
        echo "$day günün gecəsi düzülüş: VGC";
    } else if($day % 3 ==2){
        echo "$day günün gecəsi düzülüş: CVG";
    }else{
        echo "$day günün gecəsi düzülüş: GCV";
    }
    
?>