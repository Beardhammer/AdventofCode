

$list = get-content C:\users\User\Documents\input.txt

:bigloop for($x=0;$x -le $list.length; $x++){
    for ($y=0 ; $y -le $list.length; $y++){
        for($z=0; $z -le $list.length; $z++){
            if ($x -eq $y -or $x -eq $z -or $y -eq $z){break}
            $total = [int]$list[$x]+[int]$list[$y]+[int]$list[$z]
            if([int]$total -eq 2020){
                [int]$list[$x]*[int]$list[$y]*[int]$list[$z]
                break bigloop
            }
        }
    }
}
