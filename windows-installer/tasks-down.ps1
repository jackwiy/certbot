#Requires -RunAsAdministrator
[CmdletBinding()]
param()
begin {}
process {
    $tasks = "Certbot Renew & Auto-Update Task", "Certbot Renew Task"

    foreach ($task in $tasks) {
        $exists = Get-ScheduledTask | Where-Object { $_.TaskName -like $task }
        if ($exists)
        {
            Unregister-ScheduledTask -TaskName $task -Confirm:$false
        }
    }
}