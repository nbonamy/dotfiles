
We need to work on this task in a dedicated worktree.
The name of the task is "$ARGUMENTS"
If the task name is empty, and you cannot deduce it from the conversation, ask the user the name of the task.

Once you know the task name, check the list of existing worktree. Confirm with the user if you decide to use an existing worktree.

If you end up creating a worktree:
- run "npm ci" do install dependencies
- copy .env file for configuration
- copy the plan of what you are working on if you just created one

You will work in small increments commiting frequently.
You will NOT automatically merge the worktree back at the end: you need to wait for final user approval.
