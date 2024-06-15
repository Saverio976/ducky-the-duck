1. All scripts will have access to:

- Environment variables:
    - CURRENTSHELL ('bash' or 'zsh')
    - CONFIGFILE ('$HOME/.bashrc' or '$ZDOTDIR/.zshrc' or '$HOME/.zshrc')

2. The script will be running in the $CURRENTSHELL shell program

3. Script name starting with 'b-' are bad/malicious
4. Script name starting with 'g-' are good
5. Script name starting with 'p-' are for personal use (me) => config or something like this
