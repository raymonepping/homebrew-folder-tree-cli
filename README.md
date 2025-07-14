# folder_tree_cli 🌳

> “Structure isn’t boring – it’s your first line of clarity.” — folder_tree manifesto

[![brew install](https://img.shields.io/badge/brew--install-success-green?logo=homebrew&style=flat-square)](https://github.com/raymonepping/folder_tree_cli)
[![output](https://img.shields.io/badge/markdown--docs-auto--generated-blue?style=flat-square)](./FOLDER_TREE.md)
[![badge](https://img.shields.io/badge/tree--mode-decision🌿-critical?logo=github&style=flat-square)](https://medium.com/continuous-insights/automating-project-structure-insights-with-folder-tree-ed18f683d7b0)

---

## 🧭 What Is This?
folder_tree_cli is a Homebrew-installable, wizard-powered CLI that lets you explore and document any folder tree. It’s especially useful for:

DevOps projects

Scaffolding reviews

GitHub PRs and CI/CD pipelines

---

## 🚀 Quickstart

brew tap raymonepping/folder-tree-cli
brew install raymonepping/folder-tree-cli/folder-tree-cli
folder_tree

--- 

## Want to customize?

export FOLDER_TREE_HOME=/opt/homebrew/opt/folder-tree-cli/share/folder-tree-cli

--- 

## 📂 Structure
python

```
.
├── bin/                      # CLI entrypoint (folder_tree)
├── lib/                      # Reusable Bash logic
├── tpl/                      # Templates for Markdown rendering
├── folder_tree_cli.rb        # Homebrew formula
└── .brewinfo                 # Optional brew metadata
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
folder_tree

### Use flags (skip wizard)
folder_tree --output markdown --hidden

### Git mode: only tracked files
folder_tree --git

### a preset (e.g. Terraform or Vue)
folder_tree --preset terraform --output markdown

---

## ✨ Combine with
generate_project.sh → create clean structure

sanity_check.sh → validate .gitignore / .dockerignore

folder_tree → auto-document structure

commit_gh.sh → push with clarity

---

# 🧠 Philosophy
folder_tree isn’t just about pretty ASCII diagrams. It’s about:

- 📸 Creating repeatable snapshots of your project
- 🔎 Reducing ambiguity in large repo reviews
- 🧘 Cleaning up before pushing to prod

--- 

> “Clarity isn’t optional. It’s just been too manual — until now.”

📖 [Read the Full Medium Article](https://medium.com/continuous-insights/automating-project-structure-insights-with-folder-tree-ed18f683d7b0)  

---

© 2025 Raymon Epping

🧠 Powered by folder_tree.sh — 🌐 Works locally, CI/CD, and via Brew