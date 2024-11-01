$PNPMice = Get-WmiObject Win32_USBControllerDevice | %{[wmi]$_.dependent} | ?{$_.pnpclass -eq 'Mouse'}
$TouchPadID = 'HID\VID_17EF&PID_600E\8&242A03FC&0&0000'
$Mouse = $PNPMice | ?{$_.deviceid -ne $TouchPadID}
$TouchPad = $PNPMice | ?{$_.deviceid -eq $TouchPadID}

IF ($Mouse) {$TouchPad.Disable()}
IF (!$Mouse) {$TouchPad.Enable()}