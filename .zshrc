# Created by newuser for 5.9.2
# Modified by Oskr c:


eval "$(starship init zsh)"

alias ls="eza"
alias ll="eza -lah"
alias cat="bat"

#eval "$(zoxide init zsh)"

export LS_COLORS='fi=38;2;235;235;235:di=1;38;2;129;161;193:ln=38;2;136;192;208:ex=1;38;2;163;190;140'

btop-blanco() {
  sed -i 's|^color_theme = .*|color_theme = "blanco"|' ~/.config/btop/btop.conf
  btop
}

btop-oskr() {
  sed -i 's|^color_theme = .*|color_theme = "oskr"|' ~/.config/btop/btop.conf
  btop
}
export PATH="$HOME/.local/bin:$PATH"

go() {
    case "$1" in
        dc)
            discord >/dev/null 2>&1 &
            ;;
        ff)
            firefox >/dev/null 2>&1 &
            ;;
        *)
            echo "Uso: go dc | go ff"
            ;;
    esac
}




#copiar salidas de comandos:

autoload -Uz add-zsh-hook

COPY_OUTPUT_STATE="$HOME/.cache/copysalida-enabled"

_copy_last_output() {
    [[ -f "$COPY_OUTPUT_STATE" ]] || return
    [[ -n "$KITTY_WINDOW_ID" ]] || return

    kitten @ get-text --extent=last_cmd_output 2>/dev/null | wl-copy
}

copysalida() {
    case "$1" in
        on)
            mkdir -p "$HOME/.cache"
            touch "$COPY_OUTPUT_STATE"
            echo "Copia automática activada globalmente"
            ;;
        off)
            rm -f "$COPY_OUTPUT_STATE"
            echo "Copia automática desactivada globalmente"
            ;;
        status)
            if [[ -f "$COPY_OUTPUT_STATE" ]]; then
                echo "Copia automática: activada"
            else
                echo "Copia automática: desactivada"
            fi
            ;;
        *)
            echo "Uso: copysalida on | off | status"
            ;;
    esac
}

add-zsh-hook -d precmd _copy_last_output 2>/dev/null
add-zsh-hook precmd _copy_last_output