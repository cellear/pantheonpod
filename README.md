# PantheonForge

> **Work in Progress** - This project is under active development.

PantheonForge enables developers to work on their Pantheon-hosted Drupal sites using [Drupal Forge](https://www.drupalforge.org/) development environments.

## About

This project was originally forked from [DrupalPod](https://drupal.org/project/DrupalPod), but serves a different purpose:

| | DrupalPod | PantheonForge |
|---|---|---|
| **Purpose** | Contribute to Drupal core/modules | Develop Pantheon-hosted sites |
| **Workflow** | Spin up fresh Drupal for patch testing | Import existing site from Pantheon |
| **Target** | Drupal contributors | Pantheon site developers |

## How It Works

1. **Authenticate** with Pantheon using Terminus CLI
2. **Backup** your database and files from Pantheon
3. **Import** into a Drupal Forge environment
4. **Develop** locally with full IDE support
5. **Push** changes back to Pantheon when ready

## Features

- Automatic Terminus CLI installation
- Streamlined backup/import workflow
- Pre-configured Drupal development environment
- Works with any Pantheon-hosted Drupal site

## Documentation

- [Pantheon Import Workflow](DOC/pantheon-import-workflow.md) - Step-by-step import guide
- [Terminus Commands](DOC/terminus-commands.md) - Common Terminus commands reference
- [Troubleshooting](DOC/troubleshooting.md) - Solutions to common issues

## Prerequisites

- A Pantheon account with site access
- Pantheon machine token for Terminus authentication
- Drupal Forge account

## Getting Started

*Detailed setup instructions coming soon.*

## License

MIT

## Acknowledgments

Built on the foundation of [DrupalPod](https://drupal.org/project/DrupalPod) by the Drupal community.
