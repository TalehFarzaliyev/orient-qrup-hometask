<?php
$arr = [-12, 11, -13, -5, 6, -7, 5, -3, -6];
$arr_2=[];
$arr_3=[];
$num = count($arr);
$a = 0;

for($i=0; $i < $num; $i++)
{
    if($arr[$i]<0)
    {
        $arr_2[]=$arr[$i];
        for($b=0; $b < $num; $b++)
        {
            for($j=0; $j < count($arr_2)-1; $j++)
            {
                if($arr_2[$j] > $arr_2[$j+1])
                {
                    $a = $arr_2[$j];
                    $arr_2[$j] = $arr_2[$j+1];
                    $arr_2[$j+1] = $a;
                } 
            } 
        }
    }
    else
    {
        $arr_3[]=$arr[$i];
    }
}
foreach($arr_2 as $value)
        {
        echo $value."<br>"; 
        }
foreach($arr_3 as $value)
        {
        echo $value."<br>"; 
        }

?>