#!/usr/bin/env bash

# shellcheck disable=SC2034
VERSION="1.0.0"

run_decision_tree() {
  tput bold; echo "🌳 Welcome to the Folder Tree CLI Wizard"; tput sgr0

  # 1. Directory to scan
  read -e -p "📂 Enter folder path to visualize [$(pwd)]: " target
  target="${target:-$(pwd)}"

  # 2. Output format (Markdown or terminal)
  echo
  echo "📝 Generate documentation (FOLDER_TREE.md)?"
  select output in "Yes (Markdown)" "No (Terminal only)"; do
    case $REPLY in
      1) format="markdown"; break ;;
      2) format="";         break ;;
      *) echo "❌ Invalid. Choose 1 or 2."; continue ;;
    esac
  done

  # 3. Show hidden files?
  read -n 1 -p "👀 Show hidden files (e.g. .env, .git)? [y/N]: " hidden; echo
  [[ "$hidden" =~ ^[Yy]$ ]] && hidden_flag="--hidden" || hidden_flag=""

  # 4. Dry run?
  read -n 1 -p "🔍 Run in dry mode (just print command)? [y/N]: " dry; echo
  [[ "$dry" =~ ^[Yy]$ ]] && dryrun="true" || dryrun="false"

  # 5. Summary
  echo
  tput bold; echo "📋 You chose:"; tput sgr0
  echo "  Folder     : $target"
  echo "  Format     : ${format:-Terminal}"
  echo "  Hidden     : ${hidden_flag:-No}"
  echo "  Dry Run    : $dryrun"
  echo

  read -n 1 -p "🚀 Run folder_tree now? [Y/n/B to go back]: " go; echo
  if [[ "$go" =~ ^[Nn]$ ]]; then
    echo "❌ Aborted."
    exit 0
  elif [[ "$go" =~ ^[Bb]$ ]]; then
    echo "🔄 Restarting..."
    run_decision_tree
    return
  fi

  # 6. Build command
  cmd="folder_tree \"$target\""
  [[ -n "$format" ]] && cmd+=" --output $format"
  [[ -n "$hidden_flag" ]] && cmd+=" $hidden_flag"

  tput bold; echo "▶️  Running: $cmd"; tput sgr0
  if [[ "$dryrun" == "true" ]]; then
    echo "$cmd"
  else
    eval $cmd
  fi
}
