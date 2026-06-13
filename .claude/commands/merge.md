
# Merging a worktree

It is now time to merge our worktree.

Make sure the worktree has the latest changes from original branch (main), this is really important to avoid merge conflicts and to make sure the worktree is up to date with the original branch.

If the user provided a commit message ($ARGUMENTS), it means the user wants the merge to be squashed into one commit.

If not, analyze the commits and propose a squashed commit message to the user. Use AskUserQuestion tool: proposed commit message, merge unsquashed and other allowing user to enter a custom commit message.

Merge into original branch with agreed upon commit message.
Verify the merge is successful. If doubt perform interactive investigation with the user.

## Best practices

- Do not try to switch the worktree folder to `main`: this is a worktree folder so main already exists. git will fail
- No git hard reset on main: there could be multiple worktrees that are pending merge
