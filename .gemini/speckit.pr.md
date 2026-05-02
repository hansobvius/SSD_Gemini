---
description: Create a Pull Request, checking for a remote repository first.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Check Remote Repository**: Run `git remote -v`.
   - If there is an `origin` remote: Proceed to step 3.
   - If there is NO remote repository: Proceed to step 2.
2. **Handle Missing Remote**:
   - Ask the user: "This project is not linked to a remote repository. Do you want to link it to a remote repository now?"
   - If the user says **yes**: Ask the user to provide the remote URL. Once provided, run `git remote add origin <URL>`.
   - If the user says **no**: Inform the user that they must create a new remote repository to open a PR, and stop the workflow.
3. **Push to Remote**:
   - Run `git rev-parse --abbrev-ref HEAD` to get the current branch name.
   - Run `git push -u origin <current_branch>`.
4. **Create PR**:
   - Create a Pull Request using the platform CLI tool (e.g., `gh pr create --fill` for GitHub) or by providing the direct web link to the user to open the PR in their browser.
5. **Stop and report**: Report the PR URL if created via CLI, or provide the web link to create it.
