
Our task is "$ARGUMENTS"
If the task name is empty, and you cannot deduce it from the conversation, ask the user the name of the task.

Create a detailed plan and write the plan to disk in a folder called "plans" (check if it exists and create it if needed)

The plan needs to include a fine-grained commit strategy allowing us to easily come back to any previous working point in time.

Update the file on disk at the end of each step with status

Run, update and add tests at every step

At the end of the plan execution, append key learnings to the plan. Focus on ways of working and design patterns instead of implementation details.

Format of commit message: "chore/feat/fix/test: single-line concise message all lowercase"

