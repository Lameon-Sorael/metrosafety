#!/usr/bin/env bash
set -euo pipefail

echo "== AI project verification =="

detected=0

if [ -f package.json ]; then
  detected=1
  echo "[Node] package.json detected"
  if [ -f package-lock.json ]; then
    npm ci
  else
    npm install
  fi
  npm run test --if-present
  npm run lint --if-present
  npm run typecheck --if-present
fi

if [ -f requirements.txt ] || [ -f pyproject.toml ]; then
  detected=1
  echo "[Python] project detected"
  python -m pip install --upgrade pip
  if [ -f requirements.txt ]; then
    python -m pip install -r requirements.txt
  elif [ -f pyproject.toml ]; then
    python -m pip install -e .
  fi
  if [ -d tests ]; then
    python -m pip install pytest
    python -m pytest
  else
    echo "[Python] no tests/ directory; pytest skipped"
  fi
fi

if [ "$detected" -eq 0 ]; then
  echo "No Node/Python project files detected yet."
  echo "Template/bootstrap verification passed."
fi

echo "== verification complete =="
