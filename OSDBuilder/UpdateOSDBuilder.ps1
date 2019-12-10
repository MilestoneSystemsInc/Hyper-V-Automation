#automate updating Reference images.
#Updates OSDBuilder Powershell Module.
#Updates Reference Images.

# Update OSDBuilder PoweShell Module if there is one
try {
    $Version = Get-ChildItem -Path "C:\Program Files\WindowsPowerShell\Modules\OSDBuilder" | Select-Object -First 1
    $NewVersion = Find-Module -Name OSDBuilder
    if ($Version.Name -lt $NewVersion.Version) {
        Get-OSDBuilder -Update       
    }
    Import-Module -Name OSDBuilder -Force
} 
catch {
    "Error Updating OSDBuilder PowerShell Module"
}

#Update OS-Medias and create the iso.
try { #previous media images revisions should be labeled "Superseded"
    foreach ($OSMediaSource in (Get-OSMedia | where-object {$_.Revision -eq "OK"})) {
        Update-OSMedia -Name $($OSMediaSource.Name) -Download -Execute 
        New-OSBMediaISO -FullName $OSMediaSource.FullName
    }
}
catch {
    "An error occurred while updating the OS-Media $($OSMediaSource.Name)"
}