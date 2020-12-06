$list = get-content "C:\Users\user\Documents\adventofcode\day6\input.txt"
$list += ""
$count =0
$questions = @()
foreach($line in $list){
if ($line -eq ""){
        $questions = $questions | Sort-Object -Unique
        $count += $questions.count-1
        $questions = @()

        }
    else{
    $questions += $line -split '' | sort
    }
}
$count