#!/usr/bin/env python3
import re
import sys
from pathlib import Path

PATTERNS = [
    (re.compile(r'(?i)(api[_-]?key|apikey|token|secret|password|passwd|pwd|cookie|authorization|bearer)\s*[:=]\s*["\'`]?[^"\'`\s]+'), r'\1=[REDACTED]'),
    (re.compile(r'sk-[A-Za-z0-9_-]{16,}'), '[REDACTED_API_KEY]'),
    (re.compile(r'ghp_[A-Za-z0-9_]{20,}'), '[REDACTED_GITHUB_TOKEN]'),
    (re.compile(r'xox[baprs]-[A-Za-z0-9-]{10,}'), '[REDACTED_SLACK_TOKEN]'),
    (re.compile(r'-----BEGIN [A-Z ]*PRIVATE KEY-----[\s\S]*?-----END [A-Z ]*PRIVATE KEY-----'), '[REDACTED_PRIVATE_KEY]'),
    (re.compile(r'(?i)(device[_-]?id)\s*[:=]\s*["\'`]?[^"\'`\s]+'), r'\1=[REDACTED_DEVICE_ID]'),
]

def redact(text: str) -> str:
    for pattern, replacement in PATTERNS:
        text = pattern.sub(replacement, text)
    return text

def main() -> int:
    if len(sys.argv) < 2:
        print("Usage: redact_text.py <input> [output]", file=sys.stderr)
        return 2

    inp = Path(sys.argv[1])
    out = Path(sys.argv[2]) if len(sys.argv) > 2 else None

    data = inp.read_text(encoding="utf-8", errors="replace")
    redacted = redact(data)

    if out:
        out.write_text(redacted, encoding="utf-8")
    else:
        print(redacted)

    return 0

if __name__ == "__main__":
    raise SystemExit(main())
