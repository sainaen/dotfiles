quick-commit () {
    local issue
    local ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
        issue="[TMP]"
    else
        issue=$(echo "${ref#refs/heads/}" | grep -o -E '^[A-Za-z]+-[0-9]+')
        ret=$?
        if [[ $ret != 0 ]]; then
            issue="[TMP]"
        else
            issue=$(echo "$issue" | tr '[:lower:]' '[:upper:]')
        fi
    fi
    local msg="$@"
    git add -A .
    git commit -m "${issue}: ${msg:-Quick commit}"
}

alias c="quick-commit"

