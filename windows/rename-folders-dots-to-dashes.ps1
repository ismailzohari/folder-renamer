# This PowerShell script renames all folders in the current directory and subdirectories
# by replacing all dots (.) in folder names with dashes (-).
# It does NOT affect file names or folder contents.

# Recursively get all directories (including hidden) sorted from deepest to shallowest
Get-ChildItem -Recurse -Directory -Force | Sort-Object FullName -Descending | ForEach-Object {
    $oldPath = $_.FullName
    $oldName = $_.Name
    $newName = $oldName -replace '\.', '-'  # Replace all dots with dashes

    if ($oldName -ne $newName) {
        $parent = $_.Parent.FullName
        $newPath = Join-Path $parent $newName

        # Use UNC path to handle trailing dots or other special characters
        $trueOldPath = "\\?\$oldPath"

        if (Test-Path $trueOldPath) {
            Write-Host "📁 Renaming: $trueOldPath -> $newPath"
            Rename-Item -LiteralPath $trueOldPath -NewName $newName
        } else {
            Write-Host "⛔ Not found or inaccessible: $trueOldPath"
        }
    }
}
