$Trigger= New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Tuesday -At 10pm
$User= "NT AUTHORITY\SYSTEM"
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\OSDBuilder\UpdateOSDBuilder.ps1"
Register-ScheduledTask -TaskName "OSDBuilderMonthlyUpdate" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force