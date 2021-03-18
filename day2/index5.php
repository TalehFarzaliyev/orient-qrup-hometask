<?php
// 5) Massivinizin elementləri bu şəkildədir: -12, 11, -13, -5, 6, -7, 5, -3, -6
// bu elementləri mənfidən müsbətə doğru sıralayın.
// ekrana bu nəticə çıxsın : -12 -13 -5 -7 -3 -6 11 6 5
    

    $my_arr = [-12, 11, -13, -5, 6, -7, 5, -3, -6];
    $p=[];
    $m=[];
    for($i=0; $i<count($my_arr); $i++)
    {
        if($my_arr[$i]>0){
            $p[]+= $my_arr[$i];
            
        }else{
            $m[]+= $my_arr[$i];
        
        }
    }
    echo "<pre>";print_r($p);
    echo "<pre>";print_r($m);
    


?>