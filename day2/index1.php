<?php
// Kvadrat tənlik
// ax2 + bx + c = 0 (a ≠ 0) kvadrat tənliyinin həlli proqramını tərtib etməli.

// Giriş verilənləri

// Tək sətirdə boşluqla ayrılmış kvadrat tənliyin əmsalları olan a, b və c tam ədədləri verilir. Əmsalların qiyməti modulca 100-dən böyük deyil.

// Çıxış verilənləri

// Tək sətirdə tənliyin kökü yoxdursa, "No roots" (dırnaqsız), yalnız bir kökü varsa, "One root:" (dırnaqsız),
//  sonra isə boşluqla ayrılmış kökün qiymətini, tənliyin iki kökü olarsa, əvvəlcə "Two roots:" (dırnaqsız), 
//  sonra isə boşluqla ayrılmış əvvəlcə qiyməti kiçik olan kökü və qiyməti böyük olan kökü verməli.
//  Köklərin olması halında onların qiymətinin tam olmasına zəmanət verilir.
            $a=1;
            $b=-15;
            $c=6;
            $d=$b*$b-4*$a*$c;
            if($d<0){
                echo 'Tənliyin kökü yoxdur. ';
            }else if($d==0){
                echo "Tənliyin bir kökü var: ";
                $x=(-$b)/2*$a;
                echo $x;

            }else{
                echo "Tənliyin iki kökü var: ";
                $x1=round(-$b + sqrt($d))/2*$a."  ";
                $x2=round(-$b - sqrt($d))/2*$a; 
                // echo $x1."<br>";
                // echo $x2."<br>";
                if($x1>$x2){
                    echo $x2." və ".$x1;
                }else{
                    echo $x1.$x2;
                }
            }




?>