---
name: fast-iteration
description: Make small, reversible code or UI tweaks in a rapid user-steered loop without tests, lint, builds, or verification. Use when the user invokes fast-iteration or explicitly requests this no-check iteration mode.
---

# Fast iteration

Treat each request as a provisional edit, not a completed or validated change.

1. Read only enough of the relevant code to place the edit safely. Make the smallest change that implements the user's latest direction; leave adjacent polish and cleanup alone.
2. During the loop, do not add or run tests, lint, typecheck, builds, previews, screenshots, diff checks, or other verification. Do not commit or push. If the user explicitly requests one of these, do that requested action.
3. Report the provisional change briefly in commentary. If the runtime has an interruptible wait tool, keep the turn open for the next instruction with bounded waits of about 30–45 seconds. Repeat while idle, with only the occasional brief heartbeat required by the host. The wait should wake on user input; do not poll every second. If the runtime cannot receive new input during a wait, hand back promptly instead.

Keep existing user changes intact. Do not use this mode to skip checks needed before a destructive, security-sensitive, data-migrating, or externally visible action; stop and ask to leave fast iteration if that is what the next change requires.

When the user says stop, exit, or done, end the loop. Do not infer a request to test, review, commit, or otherwise validate the accumulated changes. Those actions require a separate explicit request.

A held turn can be interrupted or ended by the host. The skill does not persist into a later turn; if that happens, invoke `$fast-iteration` again.
