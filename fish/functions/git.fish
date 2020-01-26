function g
  git $argv
end

complete -c g -w git

# Hub
function openpr
  hub pull-request --browse
end
