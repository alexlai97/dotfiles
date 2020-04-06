# Defined in - @ line 1
function w3m --wraps='env TERM=xterm w3m' --description 'alias w3m=env TERM=xterm w3m'
  env TERM=xterm w3m $argv;
end
