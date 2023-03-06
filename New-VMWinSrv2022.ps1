$ErrorActionPreference = 'Stop'
#$isoFile = '\\MERLIN\VMMLibrary\ISOs\en_windows_server_2019_updated_sept_2019_x64_dvd_199664ce.iso'
$isoFile = 'E:\VMMLibrary\Iso\en-us_windows_server_2022_updated_feb_2023_x64_dvd_76afefb5.iso'
$vmName = 'VM-BOZO'
$pass = 'bozoleclown'

.\New-VMFromWindowsImage.ps1 -SourcePath $isoFile -Edition 'Windows Server 2022 Standard (Desktop Experience)' -VMName $vmName -VHDXSizeBytes 120GB -AdministratorPassword $pass -Version 'Server2022Standard' -MemoryStartupBytes 8GB -VMProcessorCount 2 -VMSwitchName 'Ascendium - Logical Switch'

$sess = .\New-VMSession.ps1 -VMName $vmName -AdministratorPassword $pass

#.\Set-NetIPAddressViaSession.ps1 -Session $sess -IPAddress 192.168.1.201 -PrefixLength 16 -DefaultGateway 192.168.1.1 -DnsAddresses '8.8.8.8','8.8.4.4' -NetworkCategory 'Public'

.\Enable-RemoteManagementViaSession.ps1 -Session $sess

Remove-PSSession -Session $sess