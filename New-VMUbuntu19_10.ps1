$ErrorActionPreference = 'Stop'
#$isoFile = '\\MERLIN\VMMLibrary\ISOs\en_windows_server_2019_updated_sept_2019_x64_dvd_199664ce.iso'
$isoFile = 'D:\VMMLibrary\ISOs\ubuntu-19.10-server-cloudimg-amd64.img'
$vmName = 'VM-LINUXDOCKER'
$fqdnName = 'VM-LINUXDOCKER.ascendium.ca'
$pass = 'bozoleclown'
$rootPublicKey = Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"
$switchName = 'Ascendium - Logical Switch'

#.\New-VMFromWindowsImage.ps1 -SourcePath $isoFile -Edition 'Windows Server 2019 Standard (Desktop Experience)' -VMName $vmName -VHDXSizeBytes 120GB -AdministratorPassword $pass -Version 'Server2019Standard' -MemoryStartupBytes 2GB -VMProcessorCount 2 -VMSwitchName 'Ascendium - Logical Switch'
.\New-VMFromUbuntuImage.ps1 -SourcePath $isoFile -VMName $vmName -FQDN $fqdnName -VHDXSizeBytes 120GB -RootPublicKey $rootPublicKey -MemoryStartupBytes 1GB -EnableDynamicMemory -ProcessorCount 2 -SwitchName $switchName -Verbose -InstallDocker
