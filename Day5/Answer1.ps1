$list = Get-Content C:\users\user\Documents\adventofcode\input
$seatid = 0
foreach($seat in $list){
    $rowbinary= $seat.Substring(0,7) -replace"f","0" -replace "B","1"
    $row = [convert]::ToInt32("$rowbinary",2)
    $columnbinary = $seat.Substring(7,3) -replace"l","0" -replace "r","1"
    $column = [convert]::ToInt32("$columnbinary",2)
    $currentseatid = ($row *8) + $column
    write-host row is $row
    write-host column is $column
    if($currentseatid -gt $seatid){$seatid = $currentseatid}
    }
    $seatid