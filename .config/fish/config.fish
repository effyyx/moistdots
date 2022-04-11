if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR subl
    starship init fish | source
    alias ls="exa -al --color=always --icons --group-directories-first"
    alias em="emacs -nw"
    alias cat="bat"
    alias fontpreview="fontpreview-ueberzug"
end
