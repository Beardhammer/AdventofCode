$list = get-content C:\users\user\Documents\adventofcode\input2.txt
$x=0
foreach($item in $list){
    $occurances=0
    $splititem = $item.Replace(':','').split(' ')
    $minmax = $splititem[0].split('-')
    foreach($letter in $splititem[2].ToCharArray()){
        
        if($letter -eq "$($splititem[1])"){
            $occurances++}}
            
             if ($occurances -ge $minmax[0] -and $occurances -le $minmax[1]){
              $x++
}

}

$x
