---
name: review
description: Use when the user asks for a code review of local, staged, or worktree changes, prioritizing duplication, refactoring opportunities, tests, and risks.
---

# Review time

## Identifying work

You will find the work to review by looking at (whichever is not empty 1st)

- `git diff`: changes to local files not staged yet
- `git diff --staged`: changes to local files already staged
- changes made since the creation of the worktree

The work was about: $ARGUMENTS

## Expectations

Check what we changed and conduct a full review:

- Identify duplicated code and refactoring opportunities.
- Ensure we have added proper tests for new features.
- Ensure we have updated tests for feature modifications.
