#!/usr/bin/env bash

# shellcheck disable=SC2034
VERSION="1.0.16"

# --- COLORS & ICONS ---
color_reset=$'\e[0m'
color_green=$'\e[32m'
color_red=$'\e[31m'
color_yellow=$'\e[33m'
color_blue=$'\e[34m'
color_bold=$'\e[1m'
color_info=$'\e[36m'

icon_ok="✅"
icon_warn="⚠️"
icon_err="❌"
icon_tree="🌳"
icon_info="ℹ️"
icon_md="📜"
icon_git="🔗"
icon_hidden="👻"
icon_preset="🧰"
icon_excl="🛡️"
icon_target="📂"

# Logging helpers (QUIET must be set in main)
log_info()    { [[ "${QUIET:-false}" == false ]] && echo -e "${color_info}${icon_info} $*${color_reset}"; }
log_ok()      { [[ "${QUIET:-false}" == false ]] && echo -e "${color_green}${icon_ok} $*${color_reset}"; }
log_warn()    { [[ "${QUIET:-false}" == false ]] && echo -e "${color_yellow}${icon_warn} $*${color_reset}"; }
log_err()     { echo -e "${color_red}${icon_err} $*${color_reset}" >&2; }
log_target()  { [[ "${QUIET:-false}" == false ]] && echo -e "${color_blue}${icon_target} $*${color_reset}"; }
log_excl()    { [[ "${QUIET:-false}" == false ]] && echo -e "${color_yellow}${icon_excl} $*${color_reset}"; }
log_preset()  { [[ "${QUIET:-false}" == false ]] && echo -e "${color_bold}${icon_preset} $*${color_reset}"; }
log_hidden()  { [[ "${QUIET:-false}" == false ]] && echo -e "${color_yellow}${icon_hidden} $*${color_reset}"; }

# Print version (main script sets VERSION)
print_version() {
  echo -e "${icon_tree} folder_tree ${VERSION}"
  exit 0
}

# Preset lister (main script must set EXCLUDE_PRESETS)
list_presets() {
  echo "📦 Available --preset options:"
  for key in "${!EXCLUDE_PRESETS[@]}"; do
    echo "  - $key"
  done | sort
  exit 0
}

# Template resolver: finds file in Homebrew, dev, or CWD
find_template() {
  local name script_dir
  if [[ $# -eq 2 ]]; then
    name="$1"
    script_dir="$2"
  elif [[ $# -eq 1 ]]; then
    name="$1"
    script_dir="$(pwd)"
  else
    log_err "find_template called without arguments"
    exit 1
  fi
  local paths=(
    "$script_dir/../tpl/$name"
    "$script_dir/tpl/$name"
    "./tpl/$name"
  )
  for p in "${paths[@]}"; do
    [[ -f "$p" ]] && echo "$p" && return 0
  done
  log_err "Could not find $name"
  exit 1
}


# Loads exclude patterns from file, populating given array by name
load_excludes_from_file() {
  local file="$1"
  local -n arr_ref="$2"
  if [[ -f "$file" ]]; then
    while IFS= read -r line; do
      [[ -n "$line" && ! "$line" =~ ^# ]] && arr_ref+=("$line")
    done <"$file"
  fi
}

# Validates the directory exists
validate_target_dir() {
  local dir="$1"
  if [[ ! -d "$dir" ]]; then
    log_err "Directory not found: $dir"
    exit 1
  fi
}

# Converts tree output to Markdown (for output mode markdown)
tree_to_markdown() {
  awk '
    {
      gsub(/\u2502/, "|")
      gsub(/\u251c\u2500\u2500 /, "- ")
      gsub(/\u2514\u2500\u2500 /, "- ")
      gsub(/    /, "  ")
      print
    }
  '
}

generate_folder_tree_badges_block() {
  local version="$1"
  cat <<EOF
[![Folder Tree](https://img.shields.io/badge/folder--tree-generated-blue?logo=tree&style=flat-square)](./FOLDER_TREE.md)
[![Folder Tree Version](https://img.shields.io/badge/folder--tree-v${version}-purple?style=flat-square)](./FOLDER_TREE.md)
EOF
}