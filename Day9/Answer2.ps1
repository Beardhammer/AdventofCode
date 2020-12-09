$list = get-content "C:\Users\matt\Documents\adventofcode\day9\input.txt"
$final= 556543474
$nums = @()
for($x=0;$x -lt $list.length;$x++){
    $nums += $list[$x]
    if(($nums|Measure-Object -sum).sum -gt $final){
        $x= $x-$nums.Length+1
        $nums = @()
        }
    if(($nums|Measure-Object -sum).sum -eq $final){break}
        }
$nums = $nums | sort
$answer = [int]$nums[0]+[int]$nums[-1]
write-host sum is $answer