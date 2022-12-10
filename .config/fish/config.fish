if test -z "$TMUX"
    set PATH $HOME/.local/bin $PATH

    set    PATH /usr/local/opt/coreutils/libexec/gnubin    $PATH
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
end

set SHELL (which fish)

if status is-interactive
    set fish_greeting        ""
    set fish_escape_delay_ms 300

    set EDITOR nvim
    set VISUAL nvim

    bind \cw backward-kill-bigword
end
