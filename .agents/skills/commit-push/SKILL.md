---
name: Commit-Push (cp)
description: Commit and push a completed change safely in Nicolas's repos. Use when the user invokes "$cp" or asks to commit, push, publish, or "commit and push", especially after implementation work where staging boundaries, tests, and commit message format matter.
---

# Commit And Push

## Workflow

1. Identify the intended change set from the current task. Do not stage unrelated files, local environment files, secrets, generated noise, or user changes outside the request. If the intended boundary is unclear, ask before committing.

2. Stage only the intended files:

```bash
git add <file>...
```

3. Commit with Nicolas's format:

```text
chore/feat/fix/test: single-line concise message all lowercase
```

Examples:

```bash
git commit -m "fix: route new points with server-side snapping"
git commit -m "test: cover closed route clearing"
git commit -m "chore: add route studio deployment files"
```

4. Push the current branch:

```bash
git push
```

If upstream is missing, use:

```bash
git push -u origin "$(git branch --show-current)"
```

## Safety Rules

- Never commit `.env`, private keys, tokens, credentials, local database files, or accidental build artifacts unless the user explicitly requested that exact file.
- Never use destructive cleanup commands such as `git reset --hard` or `git checkout --` to make the tree convenient.
- If unrelated modified files exist, leave them unstaged and mention them.
- If tests fail, fix the failure when it is part of the current change; otherwise report the failure and avoid pushing unless the user explicitly accepts it.
- After pushing, report the commit hash, branch, remote.
