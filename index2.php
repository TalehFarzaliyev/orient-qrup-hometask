<?php
// // a1, a2,..., an həqiqi ədədlər ardıcıllığı verilir. 
// // İndeksi 3-ə qalıqsız bölünən müsbət ədədlərin sayını və
//  cəmini hesablayın.

$c=[12, 3, -7, 9, 6, 4];
$toplam=0;
$say=0;
for($i=0; $i<count($c); $i++){
    if(($i+1)%3==0 && $c[$i]>0){
        $toplam=$toplam + $c[$i];
        $say=$say+1;
       
        
    }
}
echo "Cəmi : ".$toplam."<br>";
echo "Sayı : ".$say."<br>";





?>