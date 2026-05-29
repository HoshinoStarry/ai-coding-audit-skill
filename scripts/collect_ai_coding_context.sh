#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$(pwd)}"
OUT="${2:-ai-coding-context-inventory.md}"

redact() {
  sed -E \
    -e 's/(api[_-]?key|apikey|token|secret|password|passwd|pwd|cookie|authorization|bearer)[[:space:]]*[:=][[:space:]]*["'\''`]?[^"'\''`[:space:]]+/\1=[REDACTED]/Ig' \
    -e 's/(sk-[A-Za-z0-9_-]{16,})/[REDACTED_API_KEY]/g' \
    -e 's/(ghp_[A-Za-z0-9_]{20,})/[REDACTED_GITHUB_TOKEN]/g' \
    -e 's/(xox[baprs]-[A-Za-z0-9-]{10,})/[REDACTED_SLACK_TOKEN]/g'
}

echo "# AI Coding Context Inventory" > "$OUT"
echo "" >> "$OUT"
echo "- Root: \`$ROOT\`" >> "$OUT"
echo "- Generated: $(date -Iseconds)" >> "$OUT"
echo "- Excluded: assistant private memory, prior chat memory, user profile memory, inaccessible cloud histories" >> "$OUT"
echo "" >> "$OUT"

echo "## Repository context" >> "$OUT"
repo_paths=(
  "AGENTS.md"
  "CLAUDE.md"
  "GEMINI.md"
  ".cursor"
  ".cursor/rules"
  ".cursorrules"
  ".windsurf"
  ".windsurfrules"
  ".clinerules"
  ".roo"
  ".roomodes"
  ".continue"
  ".vscode"
  ".github/copilot-instructions.md"
  ".claude"
  ".codex"
  "docs"
  "prompts"
  "plans"
  "tasks"
  "reviews"
  "package.json"
  "turbo.json"
  "pyproject.toml"
  "Cargo.toml"
  "Makefile"
)

for p in "${repo_paths[@]}"; do
  if [ -e "$ROOT/$p" ]; then
    echo "- FOUND: \`$p\`" >> "$OUT"
  else
    echo "- not found: \`$p\`" >> "$OUT"
  fi
done

echo "" >> "$OUT"
echo "## User tool context, local only" >> "$OUT"
home_paths=(
  "$HOME/.claude"
  "$HOME/.claude/projects"
  "$HOME/.claude/plans"
  "$HOME/.claude/settings.json"
  "$HOME/.claude.json"
  "$HOME/.codex"
  "$HOME/.codex/config.toml"
  "$HOME/.codex/instruction.md"
  "$HOME/.codex/rules"
  "$HOME/.cursor"
  "$HOME/.continue"
  "$HOME/.cline"
  "$HOME/.roo"
  "$HOME/.windsurf"
  "$HOME/.gemini"
  "$HOME/.qwen"
)

for p in "${home_paths[@]}"; do
  if [ -e "$p" ]; then
    echo "- FOUND: \`$p\`" >> "$OUT"
  else
    echo "- not found: \`$p\`" >> "$OUT"
  fi
done

echo "" >> "$OUT"
echo "## Git summary" >> "$OUT"
if git -C "$ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  {
    echo "### git status --short"
    echo '```text'
    git -C "$ROOT" status --short
    echo '```'
    echo ""
    echo "### git diff --stat"
    echo '```text'
    git -C "$ROOT" diff --stat
    echo '```'
    echo ""
    echo "### recent commits"
    echo '```text'
    git -C "$ROOT" log --oneline -n 10
    echo '```'
  } | redact >> "$OUT"
else
  echo "Not a git repository." >> "$OUT"
fi

echo "" >> "$OUT"
echo "## Notes" >> "$OUT"
echo "- This script lists context sources and basic git status only." >> "$OUT"
echo "- It does not dump sensitive tool history." >> "$OUT"
echo "- It does not use assistant memory or prior chat memory." >> "$OUT"
echo "- Review sensitive files manually with redaction." >> "$OUT"

echo "Wrote $OUT"
