# Gemini CLI SDD (Spec-Driven Development)

This project serves as a starting environment for Spec-Driven Development (SDD) using the Gemini CLI. The goal of SDD is to leverage AI agents to streamline software development by turning specifications into code. This repository configures a standardized workspace, including automated agent workflows and VS Code task integrations to enhance the developer experience with the Gemini CLI.

## Directory Structure

### `.gemini/`
The `.gemini/` folder is the core configuration directory for the Gemini CLI's agentic capabilities. It contains instructions, rules, skills, and workflows that define how the AI agents should operate within this project.

Inside `.gemini/`, you'll find:

- **`workflows/`**: This directory contains step-by-step instructions (workflows) that the AI agents follow to complete complex tasks autonomously.
  - **`speckit.commit.md`**: An automated Git commit workflow. When triggered, the agent analyzes project changes, prompts the user to select the target branch (current or new), generates an appropriate commit message, and executes the commit upon user approval.
  - **`speckit.pr.md`**: An automated Pull Request workflow. The agent checks if the local repository is linked to a remote origin. If linked, it pushes the current branch and creates a PR. If not, it assists the user in linking the repository before proceeding.
  
- **`skills/`**: (Currently empty) This directory is intended for custom executable tools or scripts (skills) that extend the capabilities of the AI agents.

### `.vscode/`
Contains Visual Studio Code workspace settings.
- **`tasks.json`**: Automates the startup of the Gemini CLI whenever this project folder is opened in VS Code, ensuring the development environment is immediately ready for interaction.

## Getting Started

1. Open this project folder in Visual Studio Code.
2. The Gemini CLI will automatically launch in the integrated terminal (via `.vscode/tasks.json`).
3. Interact with the Gemini CLI agent to start developing based on your specifications or to utilize the configured `commit` and `pr` workflows.
