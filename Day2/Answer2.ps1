$list = get-content C:\users\User\Documents\adventofcode\input2.txt
$x=0
foreach($item in $list){
    $y=0
    $splititem = $item.Replace(':','').split(' ')
    $positions = $splititem[0].split('-')
    $fixedword = $splititem[2].Insert(0,' ')
       if($fixedword[$positions[0]] -eq $splititem[1]){$y++}
       if($fixedword[$positions[1]] -eq $splititem[1]){$y++}
       if($y -eq 1){$x++}
}

$x
