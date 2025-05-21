#!/bin/bash

# 입력 인자가 없거나 파일이 존재하지 않으면 사용법 출력
if [ $# -ne 1 ] || [ ! -f "$1" ]; then
  echo "사용법: $0 <Markdown 이슈 파일 경로>"
  echo "예: $0 bug/2025-05-21_camera_freeze.md"
  exit 1
fi

MD_FILE=$1

# 추출
LABEL=$(basename $(dirname "$MD_FILE"))   # 폴더 이름이 라벨
TITLE=$(head -n 1 "$MD_FILE" | sed 's/^#* *//')  # 첫 줄 = 제목

# GitHub CLI 명령어
gh issue create \
  --title "$TITLE" \
  --body-file "$MD_FILE" \
  --label "$LABEL" \
  --assignee "pcw1029"

