$list = get-content C:\users\user\Documents\adventofcode\day3\input.txt
$move= 1,3
$pos = 0,0 
$treecount=0
for($x=0;$x -lt $list.length; $x++){
    if ($list[$pos[1]][$pos[0]] -eq "#"){
    
        $treecount++}
    $pos[1]=$pos[1]+$move[0]
    $pos[0]=($pos[0]+$move[1])%31
    

}
$treecount
