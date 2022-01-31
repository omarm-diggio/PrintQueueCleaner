$PrinterList = Get-Printer | foreach { $_.Name }
foreach($printer in $PrinterList){
    Get-PrintJob -PrinterName $printer | foreach({
        if($_.jobstatus -ccontains 'paused' -or $_.jobstatus -contains 'error'){
            Remove-PrintJob -ID $_.id -PrinterName $printer
        }
    })
}
