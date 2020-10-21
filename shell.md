## Shell customization

### simple git branch display

Add these definitions to your shell's rc file (~/.bashrc, ~/.kshrc):
```
# git branch utility
function gitbranch {
	echo -n `git branch --show-current 2>/dev/null`
}

# this evaluates to either "" or "(branch) "
GITBRANCH='$({ BR=$(gitbranch); echo -n ${BR:+"($BR) "}; unset BR; })'
```

Customize your prompt with `$GITBRANCH`:
```
# customize prompt: "user@host ~/repo (master) $ "
PS1='\u@\h \w '$GITBRANCH'\$ '
```
