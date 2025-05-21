#!/bin/bash

# 인자 유효성 검사
if [ $# -ne 2 ]; then
  echo "사용법: $0 <이슈 유형> <제목 키워드>"
  echo "예: $0 bug gstreamer_hang"
  echo "템플릿은 <이슈 유형>/template.md 에 위치해야 합니다."
  exit 1
fi

TYPE=$1       # 예: bug, enhancement, task, ...
TITLE=$2      # 예: gstreamer_hang

DATE=$(date +%Y-%m-%d)
DIR="$TYPE"
TEMPLATE="$DIR/template.md"
FILENAME="$DIR/${DATE}_${TITLE}.md"

mkdir -p "$DIR"

if [ ! -f "$TEMPLATE" ]; then
  echo "템플릿이 없습니다: $TEMPLATE"
  exit 1
fi

# 템플릿 읽어서 날짜 삽입
sed "s/{{DATE}}/$DATE/g" "$TEMPLATE" > "$FILENAME"

echo "생성 완료: $FILENAME"

# typora가 설치되어 있으면 열기
if command -v typora >/dev/null 2>&1; then
  typora "$FILENAME" &
else
  echo "Typora가 설치되어 있지 않아 에디터를 열 수 없습니다."
fi
