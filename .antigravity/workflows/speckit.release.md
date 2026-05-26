# GitHub Release Workflow

**Description:** This workflow automates the process of creating a new GitHub Release for the project from the terminal.

## Steps

### 1. Pre-requisite: Check for GitHub CLI (`gh`)
Before attempting to create a release, verify if the user has the GitHub CLI installed.
- **Action:** Run a command to check for `gh` (e.g., `gh --version`).
- **If installed:** Proceed directly to Step 2.
- **If NOT installed:** Stop the workflow and instruct the user on how to install it. Provide instructions specific to their OS (e.g., `winget install --id GitHub.cli` for Windows, `brew install gh` for macOS). Wait for the user to confirm they have installed it and authenticated (`gh auth login`) before continuing.

### 2. Request Release Version
Once the GitHub CLI is confirmed to be available, ask the user for the version number.
- **Action:** Prompt the user with a question like: "What version number would you like to use for this new release? (e.g., v1.0.0)"
- **Wait** for the user's input.

### 3. Create the Release
Using the version provided by the user, initiate the release creation.
- **Action:** Propose the `gh release create` command to the user. It is highly recommended to use the `--generate-notes` flag to automatically include pull requests and commits in the release notes.
  - Example command: `gh release create <version_provided_by_user> --generate-notes`
- **Wait** for the user to approve and run the command.
- Confirm success or help troubleshoot any errors.
