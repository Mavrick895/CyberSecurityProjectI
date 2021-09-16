$directory = Get-ChildItem
Foreach ($item in $directory) {
Get-Acl $item
}