$list = get-content "C:\Users\user\Documents\adventofcode\day4\input.txt"| %{$_.split(' ')}
$Allpassports = @()
$obj = New-Object -TypeName PSObject
foreach($line in $list){
if ($line -eq ""){
        $Allpassports += $obj
        Clear-Variable -Name obj
        $obj = New-Object -TypeName PSObject
        }
    else{$split = $line.split(':')
    $obj | Add-Member -MemberType NoteProperty -Name $split[0] -Value $split[1]}

}
$mandoprops = "byr","iyr","eyr","hgt","hcl","ecl","pid"
$validports = @()
:passloop foreach ($pass in $allpassports){
foreach($prop in $mandoprops){
        if($prop -notin ($pass|gm).name){$pass;continue passloop}
    }$validports += $pass

}
$validports.count
$datavalid =@()
:passloop foreach($singlepassport in $validports){
if($singlepassport.byr -lt 1920 -or $singlepassport.byr -gt 2002 -and $singlepassport.byr -match "\d\d\d\d"){continue passloop}
if($singlepassport.iyr -lt 2010 -or $singlepassport.iyr -gt 2020 -and $singlepassport.iyr -match "\d\d\d\d"){continue passloop}
if($singlepassport.eyr -lt 2020 -or $singlepassport.eyr -gt 2030 -and $singlepassport.eyr -match "\d\d\d\d"){continue passloop}
if($singlepassport.hgt -like "*cm" -or $singlepassport.hgt -like "*in"){
    if ($singlepassport.hgt -like "*cm"){
       $height = ($singlepassport.hgt -split "cm")[0]
         if ($height -lt 150 -or $height -gt 193){continue passloop}}
    if ($singlepassport.hgt -like "*in"){
        $height = ($singlepassport.hgt -split "in")[0]
    if ($height -lt 59 -or $height -gt 76){continue passloop}}
    }
    else{continue passloop}
if($singlepassport.ecl -notmatch "amb|blu|brn|gry|grn|hzl|oth"){continue passloop}
if($singlepassport.hcl -notmatch "^#[a-z0-9]{6}$"){continue passloop}
if($singlepassport.pid -notmatch "^\d{9}$"){continue passloop}
$datavalid += $singlepassport
}
$datavalid.count