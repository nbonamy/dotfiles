---
name: lossless-code-moves
description: Move, copy, extract, split, or reuse existing code with lossless mechanical transfer. Use when a refactor relocates substantial existing code between files or directories and unchanged content must remain exact.
---

# Lossless Code Moves

Treat existing source text as data to transfer, not prose to regenerate.

## Fidelity contract

- Preserve every unchanged byte mechanically. Use model-generated text only for the small parts that must actually change.
- Keep relocation separate from semantic editing: first reproduce the source material exactly at the destination, verify it, then make the requested adaptations.
- Follow higher-priority environment rules for permitted edit mechanisms. Choose the allowed mechanism that transfers existing bytes instead of transcribing them.
- Preserve file mode and other relevant metadata when the move or copy requires it.

## Workflow

1. Identify the exact source file or range, destination, and intended semantic changes. Inspect boundaries and structure; do not load a large body merely to repeat it.
2. Perform a mechanical transfer:
   - For a whole-file relocation, prefer `git mv` or `mv`.
   - For a whole-file copy, prefer `cp` (with metadata preservation when relevant).
   - When most of a source file is needed, copy the whole file and delete the unwanted regions from the copy.
   - For a contiguous portion or insertion into an existing file, extract and splice the exact source bytes with an available deterministic tool such as `sed`, `awk`, `head`/`tail`, or a small script. Use a temporary file when that makes the operation safer.
3. Apply only the necessary boundary and semantic edits: imports, declarations, visibility, names, wrappers, call sites, or genuinely changed logic.
4. Verify fidelity before considering the move complete:
   - Compare whole unchanged files with `cmp` or a checksum.
   - Compare extracted source and destination ranges byte-for-byte when only a portion moved.
   - Inspect the final diff and account for every change outside the explicitly adapted lines.
   - Run focused tests or repository checks appropriate to the refactor.

## Guardrails

- Avoid manually reproducing a substantial unchanged block in a patch, heredoc, generated response, or newly authored file.
- Do not run formatters across transferred code before the equality check; formatting is a separate, explicit change.
- If exact transfer is impossible with the available tools, pause and explain the limitation instead of silently regenerating the code.
