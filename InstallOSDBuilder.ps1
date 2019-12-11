param(
    [string] $HomePath = "C:\OSDBuilder"
)

#Install OSDBuilder
Install-Module -Name OSDBuilder -Force
Import-Module -Name OSDBuilder -Force

#configures OSDBuilder working directories
OSDBuilder -sethome $HomePath

#setup Scheduled task to update OSDBuilder and imported medias on Patch Tuesday.
.\OSDBuilder\ScheduledTask.ps1

