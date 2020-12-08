$list = get-content "C:\Users\user\Documents\adventofcode\day8\input.txt"
$listindex=0
do{
$raninstructions = @()
$acc = 0
$templist = $list.clone()
switch -Wildcard ($templist[$listindex][0..2] -join ''){
    "jmp" {$templist[$listindex]=$list[$listindex].Replace('jmp','nop')}
    "nop" {$templist[$listindex]=$list[$listindex].Replace('nop','jmp')}
    "acc" {continue}

}
$listindex++
:forloop for($x=0;$x -lt $templist.Length;$x++){
    if($x -in $raninstructions){break forloop}
    $raninstructions += $x
        switch -wildcard ($templist[$x][0..2] -join ''){
            "acc" { $acc += $templist[$x].Substring(4,$templist[$x].Length -4)}
            "jmp" {$x += $templist[$x].Substring(4,$templist[$x].Length -4)-1}
            "nop" {}
        }
    }
}
until ($x -ge $templist.length)
$acc