#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_NAME="${CONDA_ENV_NAME:-wxy-homepage}"
PORT="${PORT:-4000}"
export PORT

if ! command -v conda >/dev/null 2>&1; then
  echo "未找到 conda，请先安装 Miniconda 或 Anaconda。" >&2
  exit 1
fi

if ! conda env list | awk '{print $1}' | grep -Fxq "$ENV_NAME"; then
  echo "创建 Conda 环境: $ENV_NAME"
  conda env create -n "$ENV_NAME" -f "$ROOT_DIR/environment.yml"
else
  conda env update -n "$ENV_NAME" -f "$ROOT_DIR/environment.yml" --prune
fi

echo "使用 Conda 环境 $ENV_NAME 启动本地预览: http://127.0.0.1:$PORT"
cd "$ROOT_DIR"
conda run --no-capture-output -n "$ENV_NAME" bash -c '
  set -euo pipefail
  export PATH="$CONDA_PREFIX/bin:$CONDA_PREFIX/share/rubygems/bin:$PATH"
  export CC="${CC:-clang}"
  export CXX="${CXX:-clang++}"
  if ! command -v bundle >/dev/null 2>&1; then
    gem install bundler --no-document
  fi
  bundle config set --local path vendor/bundle
  bundle install
  bundle exec jekyll serve --livereload --host 127.0.0.1 --port "${PORT:-4000}" --baseurl ""
'
