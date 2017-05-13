function peco_github_prs
  hub issue 2> /dev/null | grep 'pull' | peco --query "$LBUFFER" | sed -e 's/.*( \(.*\) )$/\1/' | read pr
  if [ $pr ]
    open $pr
  end
end
