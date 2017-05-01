function peco_select_repository
  if set -q $argv
    ghq list -p | peco | read line; builtin cd $line
  else
    ghq list -p | peco --query $argv | read line; builtin cd $line
  end
end
