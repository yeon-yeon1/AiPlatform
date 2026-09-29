#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./nb2html.sh week5/5차시_시각검색시스템_학생
#   ./nb2html.sh "week5/5차시_시각검색시스템_학생.ipynb"

if [[ $# -ge 1 ]]; then
  input_path="$1"
else
  read -r -p "변환할 노트북 경로를 입력하세요 (예: week5/5차시_시각검색시스템_학생): " input_path
fi

if [[ -z "${input_path}" ]]; then
  echo "오류: 입력값이 비어 있습니다."
  exit 1
fi

# .ipynb 확장자가 없으면 자동으로 붙인다.
if [[ "${input_path}" == *.ipynb ]]; then
  nb_path="${input_path}"
else
  nb_path="${input_path}.ipynb"
fi

if [[ ! -f "${nb_path}" ]]; then
  echo "오류: 파일을 찾을 수 없습니다 -> ${nb_path}"
  exit 1
fi

echo "변환 시작: ${nb_path}"
python -m jupyter nbconvert --to html --embed-images "${nb_path}"
echo "완료: ${nb_path%.ipynb}.html"
