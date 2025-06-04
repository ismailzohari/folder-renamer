# This PowerShell script is designed to safely rename folders that end with a trailing dot (.)
# Windows does not allow folder names to end with a dot, and such folders can cause errors.
# This script removes the trailing dot from affected folder names using UNC paths.

# Traverse all directories recursively, from deepest to shallowest
Get-ChildItem -Recurse -Directory -Force | Sort-Object FullName -Descending | ForEach-Object {
    $oldPath = $_.FullName
    $oldName = $_.Name

    # Skip folders that do not end with a dot
    if ($oldName -notmatch '\.$') {
        return
    }

    # Remove trailing dot
    $newName = $oldName.TrimEnd('.')
    $parent = $_.Parent.FullName
    $newPath = Join-Path $parent $newName

    # Use UNC path to work around Windows limitations
    $trueOldPath = "\\?\$oldPath"

    if (Test-Path $trueOldPath) {
        Write-Host "🛠️ Fixing trailing dot: $trueOldPath -> $newPath"
        Rename-Item -LiteralPath $trueOldPath -NewName $newName
    } else {
        Write-Host "⛔ Folder not accessible: $trueOldPath"
    }
}
