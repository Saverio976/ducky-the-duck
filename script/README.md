1. All scripts will have access to:

- Environment variables:
    - CURRENT_SHELL ('bash' or 'zsh')
    - CONFIG_FILE ('$HOME/.bashrc' or '$ZDOTDIR/.zshrc' or '$HOME/.zshrc')

2. The script will be running in the $CURRENT_SHELL shell program

3. Script name starting with 'b-' are bad/malicious
4. Script name starting with 'g-' are good
