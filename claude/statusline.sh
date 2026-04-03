#!/bin/bash
# 標準入力からJSON形式のデータを読み込む
input=$(cat)

# 各種情報を取得
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
input_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // "0"')
output_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // "0"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // "0"')
session_id=$(echo "$input" | jq -r '.session_id // ""')

# セッションIDを短縮表示（先頭8文字）
short_session="${session_id:0:8}"

# ステータスライン表示
echo "${model} | ${input_tokens}/${output_tokens} tokens | Ctx: ${used}% used | ${short_session}"

