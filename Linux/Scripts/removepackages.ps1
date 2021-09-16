#Use relative path if possible, or absolute path so it can be run from anywhere

$csv = Import-Csv -Path C:\Users\azadmin\Documents\Activity\choco\chocoactivity.csv
foreach ($package in $csv) {
    #Write-Output $line.name
    choco uninstall -y $package.name
    Write-Output "$($package.name) removed!"
    #Write-Output $package.name removed!"
}