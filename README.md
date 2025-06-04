# 📁 Dot-to-Dash Folder Renamer

A simple set of cross-platform scripts for **renaming folder names** by replacing specific characters — like dots (`.`) — with custom replacements (e.g., dashes `-`), **without touching any files or folder contents**.

---

## 🧠 Why this project?

In some operating systems (especially Windows), folders with trailing dots (e.g., `my.folder.`) cause **errors when renaming or deleting**. These scripts fix such cases and offer full customization for bulk renaming needs.

---

## ✅ Features

- Rename only folder **names**, not their contents.
- Supports **Linux/macOS (Bash)** and **Windows (PowerShell)**.
- Allows **custom character replacement** (e.g., `.` → `-`, or `*` → `_`, etc.).
- Handles nested folders (recursively).
- Windows script supports **trailing dot** edge cases.
- Includes reverse operation (e.g., `-` → `.`).
- Logs actions for review.

---

## 📂 Folder structure

```
dot-to-dash-folder-renamer/
│
├── linux/
│   ├── rename-folders-dots-to-dashes.sh
│   └── revert-folders-dashes-to-dots.sh
│
├── windows/
│   ├── rename-folders-dots-to-dashes.ps1
│   └── revert-folders-dashes-to-dots.ps1
│
├── troubleshooting/
│   └── fix-trailing-dot-folders.ps1
│
└── README.md
```

---

## 🖥️ Usage: Linux / macOS (Bash)

### 🔁 Rename folders (replace `.` with `-`):

```bash
bash linux/rename-folders-dots-to-dashes.sh
```

### ↩️ Revert folders (replace `-` with `.`):

```bash
bash linux/revert-folders-dashes-to-dots.sh
```

---

## 🪟 Usage: Windows (PowerShell)

### 🔁 Rename folders (replace `.` with `-`):

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\rename-folders-dots-to-dashes.ps1
```

### ↩️ Revert folders (replace `-` with `.`):

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\revert-folders-dashes-to-dots.ps1
```

---

## 🚫 Fix errors for folders with trailing dots (Windows only)

```powershell
powershell -ExecutionPolicy Bypass -File .\troubleshooting\fix-trailing-dot-folders.ps1
```

This script uses the `\\?\` UNC path prefix to rename folders that end with dots and are otherwise not accessible.

---

## ⚙️ Customization

You can easily **change the character to be replaced** and the replacement by editing one line in each script.

For example, to replace `*` with `_` instead of `.` with `-`:

### Bash (Linux)

```bash
new_name="${base//\*/_}"  # in rename-folders-*.sh
```

### PowerShell (Windows)

```powershell
$newName = $oldName -replace '\*', '_'
```

### Important Notes:
- If you're replacing special characters (`*`, `?`, `\`, etc.), escape them properly.
- If you're on Windows and dealing with deeply nested folders or long paths, the `\\?\` prefix is critical.

---

## 📌 Notes

- **Only folder names** are changed — all files and subfolders inside remain untouched.
- Scripts **sort folders from deepest to top-level** to avoid rename conflicts.
- Supports **Unicode folder names** (e.g., فارسی، عربی، 中文, etc.)
- Requires **PowerShell 5+** (Windows) and **Bash 4+** (Linux/macOS)

---

## 🤝 Contributing

Pull requests are welcome! If you want to add GUI, logging to file, dry-run mode, etc. — feel free to contribute or open issues.

---

## 📄 License

MIT License. Free for personal and commercial use.

---

## 💬 Example Output

```
📁 Renaming: F:\Photos\Vacation.2024 → F:\Photos\Vacation-2024
📁 Renaming: /home/user/data.folder → /home/user/data-folder
```

Enjoy cleaner folder names without breaking your system! 🚀