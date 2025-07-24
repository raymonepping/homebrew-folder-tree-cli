# folder_tree 🌳

> "Structure isn't boring – it's your first line of clarity." — *You (probably during a cleanup)*

[![brew install](https://img.shields.io/badge/brew--install-success-green?logo=homebrew)](https://github.com/raymonepping/homebrew-folder_tree)
[![version](https://img.shields.io/badge/version-1.3.4-blue)](https://github.com/raymonepping/homebrew-folder_tree)

---

## 🧭 What Is This?

folder_tree is a Homebrew-installable, wizard-powered CLI that lets you explore and document any folder tree. It’s especially useful for:

- DevOps projects
- Scaffolding reviews
- GitHub PRs and CI/CD pipelines

---

## 🚀 Quickstart

```bash
brew tap raymonepping/folder-tree-cli
brew install raymonepping/folder-tree-cli/folder_tree
folder_tree
```

---

Want to customize?

```bash
export FOLDER_TREE_HOME=/opt/homebrew/opt/folder-tree-cli/share/folder-tree-cli
```

---

## 📂 Project Structure

```
./
├── bin/
│   ├── CHANGELOG_folder_tree.md
│   └── folder_tree*
├── Formula/
│   └── folder-tree-cli.rb
├── lib/
│   ├── folder_decision_tree.sh*
│   ├── folder_tree_utils.sh*
│   └── self_doc.sh*
├── tpl/
│   ├── folder_tree_md.tpl
│   ├── folder_tree.cli.vars
│   ├── readme_01_header.tpl
│   ├── readme_02_project.tpl
│   ├── readme_03_structure.tpl
│   ├── readme_04_body.tpl
│   ├── readme_05_quote.tpl
│   ├── readme_06_article.tpl
│   ├── readme_07_footer.tpl
│   ├── report_footer.tpl
│   └── report_header.tpl
├── .backup.yaml
├── .backupignore
├── .version
├── FOLDER_TREE.md
├── LICENSE
├── README.md
├── reload_version.sh*
├── repos_report_20250719_111947.md
├── sanity_check.md
├── update_formula.sh*
├── v1.0.29.tar.gz
├── v1.0.4.tar.gz
├── v1.0.5.tar.gz
└── v1.3.0.tar.gz

5 directories, 31 files
```

---

## 🔑 Key Features

- 🌿 Decision tree wizard mode (no flags required)
- 📄 Markdown output saved as FOLDER_TREE.md
- 🧼 Ignores noise via .treeignore
- 👻 Shows hidden dotfiles (.env, .git, etc.)
- ⚙️ Dry-run and advanced CLI flag support
- 🧩 Fully templated and extendable
- 🧪 Example Scenarios

---

### Auto-generate folder tree in Markdown
```bash
folder_tree
```

### Use flags (skip wizard)
```bash
folder_tree --output markdown --hidden
```

### Git mode: only tracked files
```bash
folder_tree --git
```

### A preset (e.g. Terraform or Vue)
```bash
folder_tree --preset terraform --output markdown
```

---

### ✨ Combine with

- `generate_project.sh` → create clean structure  
- `sanity_check.sh` → validate .gitignore / .dockerignore  
- `folder_tree` → auto-document structure  
- `commit_gh.sh` → push with clarity  

---

## 🧠 Philosophy

folder_tree isn’t just about pretty ASCII diagrams. It’s about:

- 📸 Creating repeatable snapshots of your project
- 🔎 Reducing ambiguity in large repo reviews
- 🧘 Cleaning up before pushing to prod

> "Clarity isn’t optional. It’s just been too manual — until now."

---

## 📘 Read the Full Medium.com article

📖 [Article](https://medium.com/continuous-insights/automating-project-structure-insights-with-folder-tree-ed18f683d7b0) 

---

© 2025 Raymon Epping  
🧠 Powered by folder_tree.sh — 🌐 Works locally, CI/CD, and via Brew
