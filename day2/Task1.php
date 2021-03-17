<?php   
    //ax2 + bx + c = 0 (a ≠ 0) kvadrat tənliyinin həlli proqramını tərtib etməli.

    $a = 1;
    $b = -5;
    $c = 6;

    $D = $b*$b - 4 * $a * $c;

    if ($D < 0){
        echo "Tənliyin həqiqi kökü yoxdur.";
    }

    else if ($D == 0){
        $x = -$b / 2 * $a;
        echo "Tənliyin bir kökü vardır: $x";
    } 
    
    else {
        echo "Tənliyin iki kökü vardır: ";

        $x1 = round((-$b + sqrt($D))/2*$a);
        $x2 = round((-$b - sqrt($D))/2*$a);
        
        if ($x1 < $x2){
            echo "$x1 $x2";
        }else{
            echo "$x2 $x1";
        }
    }
?>