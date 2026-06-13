Clean up already-merged branches and worktrees in the current git repository.

## Safety rule

Before deleting ANYTHING, you must be 100% certain it has been merged. If there is any doubt (e.g. branch not clearly listed in `git branch --merged`, worktree on a branch with unmerged commits), do NOT delete it. Instead, list what you're unsure about and ask the user for explicit confirmation before proceeding.

## Steps

1. **Gather info first**: Run `git worktree list`, `git branch -a`, and `git branch --merged` to understand the current state. Do NOT delete anything yet.

2. **Present a plan**: Show the user a clear summary of what you intend to delete (worktrees, local branches, remote branches) and what you will keep. If anything is ambiguous or you are not 100% certain it is merged, flag it and ask the user.

3. **Prune worktrees**: For worktrees (other than the main one) whose branch is confirmed merged, run `git worktree remove <path>`. Then run `git worktree prune` to clean up stale entries.

4. **Delete merged local branches**: Delete confirmed merged local branches except `main` and `master` using `git branch -d`.

5. **Delete merged remote branches**: For each deleted local branch, attempt `git push origin --delete`. Ignore errors if the remote branch is already gone.

6. **Prune stale remote refs**: Run `git remote prune origin`.

7. **Report**: Summarize what was deleted and what was already clean.
