<?php
$arr = [69, 8, 7, 5, -9, 22, 0, 6];
$num = count($arr);
$min = $arr[0];
$max = $arr[0];

for($i=0; $i < $num; $i++)
{
    if($min > $arr[$i])
    {
        $min = $arr[$i];
    }
    if($max < $arr[$i])
    {
        $max = $arr[$i];
    }
}
echo "Minimum: ".$min."<br>Maximum: ".$max;
?>