<?php
$arr = [-12, 11, -13, -5, 6, -7, 5, -3, -6];
$arr2=[];
$arr3=[];
$n = count($arr);
$a = 0;

for($i=0; $i < $n; $i++)
{
    if($arr[$i]<0)
    {
        $arr2[]=$arr[$i];
        for($b=0; $b < $n; $b++)
        {
            for($j=0; $j < count($arr2)-1; $j++)
            {
                if($arr2[$j] > $arr2[$j+1])
                {
                    $a = $arr2[$j];
                    $arr2[$j] = $arr2[$j+1];
                    $arr2[$j+1] = $a;
                } 
            } 
        }
    }
    else
    {
        $arr3[]=$arr[$i];
    }
}
foreach($arr2 as $value)
        {
        echo $value."<br>"; 
        }
foreach($arr3 as $value)
        {
        echo $value."<br>"; 
        }

?>