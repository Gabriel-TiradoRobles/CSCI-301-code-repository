# #enter your program here

$Data = Get-Volume -DriveLetter C
$Size = [math]::Round(($Data.Size / 1GB), 2)
$FreeSpace = [math]::Round(($Data.SizeRemaining / 1GB), 2)
$SizePercentage = [math]::Round((($FreeSpace / $Size) * 100) , 2)

Write-Host "C Drive Info:"
Write-Host "Size: $Size GB"
Write-Host "Free Space: $FreeSpace GB"
Write-Host "Remaining: $SizePercentage%"