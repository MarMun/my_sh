# .pi Configuration for my_sh

## Repository Mapping

| Key | Value |
|-----|-------|
| **Repository** | `MarMun/my_sh` |
| **Local Path** | `~/.my_sh` |
| **SSH Key** | `~/.ssh/pi-deploy-my_sh` |
| **Push Command** | `GIT_SSH_COMMAND="ssh -i ~/.ssh/pi-deploy-my_sh" git push origin main` |

## Project Context

- **Purpose**: Personal shell scripts and custom shell utilities
- **Type**: Dotfiles / Dev tools
- **Default Branch**: `main`

## Notes

- Uses dedicated deploy key: `pi-deploy-my_sh`
- Keep scripts POSIX-compliant where possible
