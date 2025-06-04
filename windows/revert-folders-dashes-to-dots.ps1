# This PowerShell script reverses folder renaming by replacing all dashes (-) with dots (.)
# in all folders within the current directory and its subdirectories.
# It does NOT affect file names or folder contents.

# Recursively get all directories (including hidden) sorted from deepest to shallowest
Get-ChildItem -Recurse -Directory -Force | Sort-Object FullName -Descending | ForEach-Object {
    $oldPath = $_.FullName
    $oldName = $_.Name
    $newName = $oldName -replace '-', '.'  # Reverse: replace dashes with dots

    if ($oldName -ne $newName) {
        $parent = $_.Parent.FullName
        $newPath = Join-Path $parent $newName

        # Use UNC path to handle special cases
        $trueOldPath = "\\?\$oldPath"

        if (Test-Path $trueOldPath) {
            Write-Host "↩️ Reversing: $trueOldPath -> $newPath"
            Rename-Item -LiteralPath $trueOldPath -NewName $newName
        } else {
            Write-Host "⛔ Not found or inaccessible: $trueOldPath"
        }
    }
}
