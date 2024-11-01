if test -z "$TMUX"
    set PATH $HOME/go/bin           $PATH
    set PATH $HOME/.local/bin       $PATH
    set PATH /usr/local/opt/fzf/bin $PATH

    set    PATH /usr/local/opt/coreutils/libexec/gnubin    $PATH
    set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

    # set JAVA_HOME $(/usr/libexec/java_home -v1.8)
end

set SHELL (which fish)

if status is-interactive
    set fish_greeting        ""
    set fish_escape_delay_ms 300

    set EDITOR nvim
    set VISUAL nvim

    bind \cw backward-kill-bigword

    # if test -z "$TMUX"
    #     osascript -e 'tell application "System Events"' -e 'set position of first window of application process "kitty" to {232, 67}' -e 'end tell'
    # end
end
