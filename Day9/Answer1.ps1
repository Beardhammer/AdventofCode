$list = get-content "C:\Users\user\Documents\adventofcode\day9\input.txt"
$nums = @()
0..24|%{$nums += $list[$_]}
for($x=25;$x -lt $list.length;$x++){
    $current = $list[$x]
    $lastnumbers = $nums| select -last 25
    $trigger = $false
    for($y=0;$y -le 24; $y++){

        $half = $current-$lastnumbers[$y]
        if($half -in $lastnumbers -and $half -ne $lastnumbers[$y]){
            $nums+=$current
            $trigger=$true
            break}
               
        }
        if(!($trigger)){
            $current
            break}
    }
