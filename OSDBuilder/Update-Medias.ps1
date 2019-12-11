#update images
param(
    [switch]$cleanup
)

#download and update all updates for current OSMedias
$newMedias = Get-osmedia | Where-Object {$_.revision -eq "OK"}
foreach($media in $newMedias){
    update-osmedia -Name $media.name -download -execute -CreateISO
}

#delete superseded medias
if($cleanup.IsPresent){
    $oldMedias = Get-OSMedia | Where-Object {$_.revision -eq "Superseded"}
    foreach($media in $oldMedias){
        Remove-Item $oldMedia.fullname 
    }
}
