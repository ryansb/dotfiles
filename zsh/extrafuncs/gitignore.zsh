# Usage: ignore python PyCharm vim > .gitignore
function ignore() {
    curl -s -L http://www.gitignore.io/api/${(j:,:)@}
}
