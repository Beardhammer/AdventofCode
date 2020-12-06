$list = get-content "C:\Users\user\Documents\adventofcode\day6\input.txt"
$list += ""
$everyone = @()
$questions = @()
foreach($line in $list){
    #group of people
    if ($line -eq ""){
        #letter array that at least 1 person answered yes to
        $allletters = $questions -split ''| sort -Unique
            #testing all people
            foreach($person in $questions){
                $splitperson = $person -split ''
                #testing all letters
                foreach($letter in $allletters){
                    if($letter -notin $splitperson){
                       #remove the letter if its not in a persons anwer
                       $allletters = $allletters.replace($letter,'') 
                    }
                }
            }
        $everyone += $allletters
        $questions = @()
        
        }
    else{
    $questions += $line | sort
    }
}
#removing extra lines
($everyone | ?{$_ -ne ""}).count