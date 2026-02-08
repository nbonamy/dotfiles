
# Isolating work in worktrees

We need to work on this task in a dedicated worktree.
The name of the task is "$ARGUMENTS"
If the task name is empty, and you cannot deduce it from the conversation, ask the user the name of the task.

Once you know the task name, check the list of existing worktree. Confirm with the user if you decide to use an existing worktree.

If you end up creating a worktree:

- get read AND write access to it
- run "npm ci" to install dependencies
- look for all .env files in source folder and copy them to worktree

If you just created a plan for the work, make sure you move it to the plans folder of the worktree.
If not, create a new plan as outlined in general instructions (~/.claude/CLAUDE.md)

You will work in small increments commiting frequently.
You will NOT automatically merge the worktree back at the end: you need to wait for final user approval.
