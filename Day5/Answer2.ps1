$list = Get-Content C:\users\user\Documents\adventofcode\input
$allseats=@()
foreach($seat in $list){
    $obj = New-Object -TypeName PSObject
    $rowbinary= $seat.Substring(0,7) -replace"f","0" -replace "B","1"
    $row = [convert]::ToInt32("$rowbinary",2)
    $columnbinary = $seat.Substring(7,3) -replace"l","0" -replace "r","1"
    $column = [convert]::ToInt32("$columnbinary",2)
    $obj | Add-Member -MemberType NoteProperty -Name "Row" -Value $row
    $obj | Add-Member -MemberType NoteProperty -Name "Column" -Value $column
    $allseats+=$obj

    }
$allseats = $allseats | sort -Property row,column
for($x=$allseats[0].row+1; $x -lt $allseats[-1].row-1; $x++){
    if (($allseats | ?{$_.row -eq $x}).count -lt 8){
        try{
            for($y=0;$y -le 7; $y++){
            if(!($allseats | Where-Object {$_.row -eq $x -and $_.column -eq $y})){
            throw "you found me"
            }
            }
        }
       catch{

       $myid = ($x *8) + $y
       write-host "my seat id is $myid"
            }
   }
}