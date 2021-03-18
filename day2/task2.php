<?php
$main_arr = [6.23, 7.5, 2.1, 2.3256, -3];
$n = count($main_arr);
$index_arr = [];
$cem = 0;

for($i = 0; $i <= $n; $i++)
{
    if($i%3 == 0 && $main_arr[$i] > 0)
    {
        $cem = $cem + $main_arr[$i];
        $index_arr[] = $i;   
    }
}
echo "İndeksi 3-ə qalıqsız bölünən müsbət ədədlərin sayı: ".count($index_arr)."<br>İndeksi 3-ə qalıqsız bölünən müsbət ədədlərin cəmi: ".round($cem, 2);
?>