$ErrorActionPreference = 'Stop'

#JFM
#$isoFile = '\\MERLIN\VMMLibrary\ISOs\en_windows_server_2019_updated_sept_2019_x64_dvd_199664ce.iso'
#$isoFile = 'E:\VMMLibrary\Iso\en-us_windows_server_2022_updated_feb_2023_x64_dvd_76afefb5.iso'
#$vmName = 'VM-BOZO'
#$pass = 'bozoleclown'
#$switchName = 'Ascendium - Logical Switch'
#$processorCount = 2
#$osVersion = 'Server2022Standard'
#$osEdition = 'Windows Server 2022 Standard (Desktop Experience)'
#$vhdSize = 120GB
#$ram = 8GB

# SRB
$isoFile = 'D:\VMMLibrary\Iso\en-us_windows_server_2022_updated_april_2023_x64_dvd_fac25973.iso'
$vmName = 'SRB-XPro2023'
$pass = 'Firewall1'
$switchName = 'My Virtual Switch'
$processorCount = 4
$osVersion = 'Server2022Standard'
$osEdition = 'Windows Server 2022 Standard (Desktop Experience)'
$vhdSize = 120GB
$ram = 8GB

.\New-VMFromWindowsImage.ps1 -SourcePath $isoFile -Edition $osEdition -VMName $vmName -VHDXSizeBytes $vhdSize -AdministratorPassword $pass -Version $osVersion -MemoryStartupBytes $ram -VMProcessorCount $processorCount -VMSwitchName $switchName

$sess = .\New-VMSession.ps1 -VMName $vmName -AdministratorPassword $pass

#.\Set-NetIPAddressViaSession.ps1 -Session $sess -IPAddress 192.168.1.201 -PrefixLength 16 -DefaultGateway 192.168.1.1 -DnsAddresses '8.8.8.8','8.8.4.4' -NetworkCategory 'Public'

.\Enable-RemoteManagementViaSession.ps1 -Session $sess

Remove-PSSession -Session $sess