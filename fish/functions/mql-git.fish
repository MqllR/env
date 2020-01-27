function g --wraps=git ; git $argv ; end

# Hub
function openpr --description='Open a pull request with hub'
  hub pull-request --browse
end
