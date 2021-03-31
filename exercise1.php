<?php
$a=1;
$b=8;
$c=9;

$D = $b*$b - 4*$a*$c;

$x1 = (-$b - sqrt($D)) / 2*$a;
$x2 = (-$b + sqrt($D)) / 2*$a;

if ($D < 0)
{
    echo "No roots";
}
else if ($D > 0)
{
    if ($x1 < $x2)
    {
        echo "Two roots: ".$x1.", ".$x2;
    }else
    {
        echo "Two roots: ".$x2.", ".$x1;
    }  
}
else
{
    echo "One root: ".$x1;
}
?>