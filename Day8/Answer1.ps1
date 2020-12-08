$list = get-content "C:\Users\user\Documents\adventofcode\day8\input.txt"

$raninstructions = @()
$acc = 0
:forloop for($x=0;$x -lt $list.Length;$x++){
    if($x -in $raninstructions){break forloop}
    $raninstructions += $x
    switch -wildcard ($list[$x][0..2] -join ''){
        "acc" { $acc += $list[$x].Substring(4,$list[$x].Length -4)}
        "jmp" {$x += $list[$x].Substring(4,$list[$x].Length -4)-1}
        
    }
}
$acc
