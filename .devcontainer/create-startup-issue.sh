#!/usr/bin/env bash
set -euo pipefail

# gh CLI がなければ何もしない（初期化途中などを想定）
if ! command -v gh >/dev/null 2>&1; then
  echo "Skipping startup issue creation: gh is not installed."
  exit 0
fi

# 認証されていない場合は Issue を作成できないため終了
if ! gh auth status >/dev/null 2>&1; then
  echo "Skipping startup issue creation: gh is not authenticated."
  exit 0
fi

# origin URL から owner/repo 形式のリポジトリ名を抽出
repo_url="$(git config --get remote.origin.url || true)"
repo_slug="$(printf '%s' "${repo_url}" | sed -E 's#(git@github.com:|https://github.com/)##; s#\.git$##')"

# リポジトリ名が取得できない場合は安全にスキップ
if [[ -z "${repo_slug}" ]]; then
  echo "Skipping startup issue creation: unable to detect repository from origin URL."
  exit 0
fi

# 当日・当該 Codespace 用の一意なタイトルを組み立て
start_date="$(date +%F)"
codespace_name="${CODESPACE_NAME:-unknown-codespace}"
title="Codespace started: ${codespace_name} (${start_date})"
body=$(
  cat <<EOF
This issue was created automatically when a Codespace started.

- Codespace: ${codespace_name}
- Date: ${start_date}
EOF
)

# 同タイトルの Open Issue が既にあるか確認（重複作成防止）
existing_count="$(
  gh issue list \
    --repo "${repo_slug}" \
    --state open \
    --search "${title} in:title" \
    --json number \
    --jq 'length'
)"

if [[ "${existing_count}" -gt 0 ]]; then
  echo "Startup issue already exists: ${title}"
  exit 0
fi

# 重複がなければ起動通知 Issue を作成
gh issue create --repo "${repo_slug}" --title "${title}" --body "${body}" >/dev/null
echo "Created startup issue: ${title}"
