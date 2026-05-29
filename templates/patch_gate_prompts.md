# Generic Patch Gate Prompts

## Global execution boundary

```text
You may modify code only after producing a patch plan.

Before modifying anything, output:

1. Files you will change
2. Why each file must change
3. Files you will not touch
4. Existing behavior that must remain unchanged
5. Verification command after this patch
6. Rollback method

Do not perform unrelated refactors.
Do not reformat unrelated files.
Do not remove existing options, UI behavior, command logic, permission checks, tokenization rules, config keys, or compatibility branches unless explicitly required.
If you discover the plan is wrong, stop and report.
```

## Single patch execution

```text
Execute only Patch <N> from the approved plan.

Constraints:

- Modify only the listed files.
- Preserve all existing behavior not named in the patch.
- Do not introduce new public commands or API surface unless the patch explicitly says so.
- Do not change formatting outside touched logic.
- After editing, run the specified verification command.
- If verification fails, stop and report the failure, suspected cause, and minimal fix.
- Do not continue to the next patch without approval.
```

## Verification gate

```text
You cannot mark this task complete until you provide:

1. Commands executed
2. Output summary
3. Files changed
4. Behavior verified
5. Behavior not verified
6. Known risks
7. Rollback instructions

If you did not run a command, write "not run" and explain why.
Do not claim success without evidence.
```

## Second-agent review

```text
Review the current diff as an independent engineering reviewer.

Focus on:

- Unrelated changes
- Old behavior regressions
- Security leaks
- Permission boundary mistakes
- Config migration risks
- API field assumptions
- Missing tests
- Over-design
- Bad error handling
- Concurrency risks
- Background task failures

Do not rewrite code unless asked.
Output blocking issues first.
```
