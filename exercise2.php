<?php
$arr = [6.23, 7.5, 2.1, 2.3256, -3];
$num = count($arr);
$index_arr = [];
$cem = 0;

for($i = 0; $i <= $num; $i++)
{
    if($i%3 == 0 && $arr[$i] > 0)
    {
        $cem = $cem + $arr[$i];
        $index_arr[] = $i;   
    }
}
echo "İndex-i 3-ə qalıqsız bolunen musbet ededlerin sayi: " .count($index_arr) ."<br>" . "İndex-i 3 bolunen musbet ededlerin cemi: ".round($cem, 2);
?>