## tmux customization

### start a tmux session under the name of the CWD

```
function ts {
        NAME=${1:-${PWD##*/}}
        echo "creating session: ${NAME:=/}"
        if tmux has-session -t "${NAME}" >/dev/null 2>&1 ; then
                tmux attach-session -t "${NAME}"
        else
                tmux new-session -s "${NAME}"
        fi
        unset NAME
        return 0
}
```
