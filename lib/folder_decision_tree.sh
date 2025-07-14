#!/usr/bin/env bash

run_decision_tree() {
  tput bold; echo "🌳 Folder Tree CLI"; tput sgr0
  echo "📂 Target folder: $(pwd)"
  echo

  # Default: YES for hidden
  read -n 1 -p "👀 Include hidden files (dotfiles)? [Y/n]: " hidden; echo
  [[ -z "$hidden" || "$hidden" =~ ^[Yy]$ ]] && hidden_flag="--hidden" || hidden_flag=""

  # Default: NO for markdown
  read -n 1 -p "📝 Generate FOLDER_TREE.md (Markdown)? [y/N]: " out; echo
  [[ "$out" =~ ^[Yy]$ ]] && output_flag="--output markdown" || output_flag=""

  echo
  tput bold; echo "📋 Running..."; tput sgr0
  # echo "📍 Folder     : $(pwd)"
  # echo "👻 Hidden     : ${hidden_flag:-No}"
  #echo "📝 Markdown   : ${output_flag:-No}"
  echo

  cmd="folder_tree $output_flag $hidden_flag"
  tput bold; echo "▶️  $cmd"; tput sgr0
  echo
  eval $cmd
  echo
}
