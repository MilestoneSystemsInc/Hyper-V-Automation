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
try 
{ 
    #download and update all updates for current OSMedias
    $newMedias = Get-osmedia | Where-Object {$_.revision -eq "OK"}
    foreach($media in $newMedias){
        update-osmedia -Name $media.name -download -execute -CreateISO
    }

    #delete superseded medias
    $oldMedias = Get-OSMedia | Where-Object {$_.revision -eq "Superseded"}
    foreach($media in $oldMedias){
        Remove-Item $oldMedia.fullname -Recurse
    }
}
catch {
    "An error occurred while updating the OS-Media $($OSMediaSource.Name)"
}