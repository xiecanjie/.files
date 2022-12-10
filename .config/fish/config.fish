if test -z "$TMUX"
    set PATH $HOME/.local/bin $PATH
end

set SHELL (which fish)

if status is-interactive
    set fish_greeting        ""
    set fish_escape_delay_ms 300

    set EDITOR nvim
    set VISUAL nvim

    bind \cw backward-kill-bigword
end
