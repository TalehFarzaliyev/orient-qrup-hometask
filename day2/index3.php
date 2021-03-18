<?php
// 3) n uzunluqda bir massiv düzəldin və içərisinə özünüz istənilən elementlər daxil edin (rəqəmlər)
// və bu massivin minimum və maximum-nu tapın.
      
        $a= [192, 77, 23, 34, 5, -6, 7, 8, -9, 10, 100];
        $max=$a[0];
        $min=$a[0];
        for($i=0; $i<count($a); $i++){
            if($max<$a[$i]){
                $max=$a[$i];
            }
            if($min>$a[$i]){
                $min=$a[$i];
            }
        }
        echo "Massivin minimumu => ".$max."<br>";
        echo  "Massivin maximumu => ". $min;


?>






