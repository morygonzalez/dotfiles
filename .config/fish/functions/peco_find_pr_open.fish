function peco_find_pr_open
   git log --merges --oneline --grep 'Merge pull request' | peco | awk '{print substr($5, 2)}' | read pr
   if [ $pr ]
     hub browse -- pull/$pr
   end
end
