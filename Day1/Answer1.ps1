$list = get-content C:\users\User\Documents\adventofcode\input.txt

for($x=0;$x -le $list.length; $x++){
  for($y=$x+1 ; $y -le $list.length; $y++){
    $total = [int]$list[$x]+[int]$list[$y]
    if([int]$total -eq 2020){
      [int]$list[$x]*[int]$list[$y]
      } 
    }
  }
