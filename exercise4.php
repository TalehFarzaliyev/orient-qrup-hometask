<?php
$arr = [3, -6, 15, 6, 3, -9, 25, -25, 15.55, -32, -1];
$num = count($arr);
$a = 0;

for($i=0; $i < $num; $i++)
{
    for($j=0; $j < $num-1; $j++)
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