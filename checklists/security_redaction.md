# Generic Security Redaction Checklist

Never output raw:

- API keys
- Bearer tokens
- OAuth tokens
- Cookies
- Session IDs
- Passwords
- Private keys
- SSH keys
- Device IDs
- Full Authorization headers
- Full shell history lines with secrets
- Private URLs containing tokens

Redact as:

- [REDACTED_API_KEY]
- [REDACTED_TOKEN]
- [REDACTED_PASSWORD]
- [REDACTED_COOKIE]
- [REDACTED_SESSION]
- [REDACTED_PRIVATE_KEY]
- [REDACTED_DEVICE_ID]
- [REDACTED_SECRET_URL]

When a secret is found in tool rules or history, report:

- File path
- Secret type
- Risk level
- Recommended action: rotate, remove, rewrite rule, restrict permissions
