$printerList = Get-Printer | Select -ExpandProperty "Name"
$printerObjArray = @()
Foreach ($rawPrinter in $printerList)
{
	$printerObj = New-Object -TypeName PSObject
	$printerObj | Add-Member -MemberType NoteProperty -Name "{#QUEUENAME}" -Value $rawPrinter
	$printerObjArray += $printerObj
}
$masterObject = New-Object -TypeName PSObject
$masterObject | Add-Member -MemberType NoteProperty -Name data -Value $printerObjArray

$masterObject | ConvertTo-Json