---
description: Create a git commit of project changes, asking about branch preferences first.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Check Git Status**: Run `git status` to identify modified, added, or deleted files. If there are no changes, inform the user and stop.
2. **Branch Check**: Ask the user: "Do you want to commit these changes to the current branch, or create a new branch for this commit?"
3. **Handle Branch Choice**:
   - If current branch: Proceed to commit.
   - If new branch: Ask for the new branch name. Once provided, run `git checkout -b <branch_name>`.
4. **Stage and Commit**:
   - Run `git add .` (or specific files if the user specified them).
   - Generate a clear, concise commit message based on the changes.
   - Ask the user to review the commit message before running the commit command.
   - If approved, run `git commit -m "<message>"`.
5. **Push to Remote**:
   - Run `git remote -v` to check if a remote repository is configured.
   - If an `origin` remote exists:
     - Run `git rev-parse --abbrev-ref HEAD` to get the current branch name.
     - Push the committed changes to the remote branch using `git push -u origin <current_branch>`.
   - If no remote is configured, inform the user that the commit was created locally but could not be pushed.
6. **Stop and report**: Report the created commit hash, the branch it was committed to, and whether the push was successful.
