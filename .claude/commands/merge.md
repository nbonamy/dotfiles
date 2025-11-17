
# Merging a worktree

It is now time to merge our worktree. We will do so by:

- make sure the worktree has the latest changes from original branch.
- squashing all the commits into one commit
- use the the following commit message: "$ARGUMENTS". If the commit message is empty, discuss it with the user but NEVER EVER add Claude mentions to your commit message.
- merge into original branch with agreed upon commit message.
- verify the merge is successful. If doubt perform interactive investigation with the user.

## Best practices

- Do not try to switch the worktree folder to `main`: this is a worktree folder so main already exists. git will fail
- No git hard reset on main: there could be multiple worktrees that are pending merge

