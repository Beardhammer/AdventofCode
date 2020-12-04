$list = get-content C:\users\user\Documents\adventofcode\day3\input.txt
$vertical = 1,1,1,1,2
$horizontal = 1,3,5,7,1
$final = 1
for($p=0;$p -lt 5; $p++){
$treecount=0
$pos = 0,0
    for($x=0;$x -lt $list.length; $x++){
        if ($list[$pos[1]][$pos[0]] -eq "#"){
    
             $treecount++}
       $pos[1]=$pos[1]+$vertical[$p]
       if ($pos[1] -gt $list.length){break}
       $pos[0]=($pos[0]+$horizontal[$p])%31
    

    }
$final =$treecount *$final
}
$final
