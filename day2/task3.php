<?php
$arr = [63, 4, 6, 5, -9, 25, -50, 0, 15, -2];
$n = count($arr);
$min = $arr[0];
$max = $arr[0];

for($i=0; $i < $n; $i++)
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