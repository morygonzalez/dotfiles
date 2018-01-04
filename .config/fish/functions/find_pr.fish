function find_pr
   git log $argv..HEAD --merges --ancestry-path --reverse --oneline | head -1
end
