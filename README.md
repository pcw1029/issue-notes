# 📝 GitHub 이슈 자동화 스크립트

이 저장소는 Markdown 파일 기반으로 GitHub 이슈를 생성하고, 템플릿을 이용해 이슈 양식을 쉽게 만드는 두 개의 스크립트를 제공합니다.



---

## 📁 스크립트 구성

- `create_issue_from_md.sh`: `.md` 파일을 기반으로 GitHub 이슈를 생성
- `new_issue.sh`: 템플릿을 이용해 새 이슈 `.md` 파일을 자동 생성



---

## 1️⃣ new_issue.sh – Markdown 이슈 파일 생성기

### 📌 개요

이 스크립트는 지정된 이슈 유형(예: bug, task)에 따라 템플릿을 바탕으로 이슈용 `.md` 파일을 자동 생성합니다.

### 🧾 사용법

```bash
./new_issue.sh <TYPE> <TITLE>
```

- `<TYPE>`: 이슈 유형 (예: `bug`, `documentation`, `enhancement`)
- `<TITLE>`: 파일 이름에 사용될 이슈 제목 키워드



### ✅ 예시

```bash
./new_issue.sh bug gstreamer_crash
```

- 생성 파일: `bug/2025-05-21_gstreamer_crash.md`
- 사용된 템플릿: `bug/template.md`



---

## 2️⃣ create_issue_from_md.sh – GitHub 이슈 생성기

### 📌 개요

이 스크립트는 `.md` 파일의 내용을 읽어 GitHub CLI를 통해 이슈를 생성합니다.



### 🧾 사용법

```bash
./create_issue_from_md.sh <MARKDOWN_FILE>
```

- `<MARKDOWN_FILE>`: 생성된 마크다운 파일 경로



### ✅ 예시

```bash
./create_issue_from_md.sh bug/2025-05-21_gstreamer_crash.md
```

- 이슈 제목: 마크다운 파일의 첫 줄(`# 제목`)
- 이슈 본문: 마크다운 전체 내용
- 이슈 라벨: 마크다운 파일이 위치한 폴더 이름 (`bug`)
- 이슈 담당자: `pcw1029`



### ⚙️ 사전 조건

- GitHub CLI (`gh`)가 설치되어 있어야 함
- `gh auth login`으로 GitHub에 로그인 되어 있어야 함
- 권한이 있는 GitHub 리포지토리에서 실행해야 함



---

## 🔧 예시 워크플로우

1. 새 이슈 마크다운 파일 생성  
   ```bash
   ./new_issue.sh enhancement improve_ui_layout
   ```

2. Markdown 파일에 내용을 채운 후

3. GitHub 이슈 생성  
   ```bash
   ./create_issue_from_md.sh enhancement/2025-05-21_improve_ui_layout.md
   ```





---

## 📁 템플릿 예시 (`bug/template.md`)

```markdown
# 버그 제목 예시

- 날짜: {{DATE}}
- 증상:
- 재현 방법:
- 로그:
```

---

## 📌 팁

- 템플릿은 `bug`, `documentation`, `enhancement` 디렉토리별로 관리 그외 추가 가능하지만 템플릿 밋 github의 label등 등록이 필요



---

## 📜 라이선스

MIT License
