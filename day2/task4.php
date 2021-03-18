<?php
$arr = [32, 4, 0, 6, 3, -9, 25.25, -25, 15.96, -36.25364, -2];
$n = count($arr);
$a = 0;

for($i=0; $i < $n; $i++)
{
    for($j=0; $j < $n-1; $j++)
    {
        if($arr[$j] > $arr[$j+1])
        {
            $a = $arr[$j];
            $arr[$j] = $arr[$j+1];
            $arr[$j+1] = $a;
        } 
    } 
}
foreach($arr as $value){
    echo $value."<br>"; 
}
?>