alias gcd="cd (git rev-parse --show-toplevel)"

function g --wraps=git ; git $argv ; end
