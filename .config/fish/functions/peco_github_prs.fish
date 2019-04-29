function peco_github_prs
  hub pr list 2> /dev/null | peco --query "$LBUFFER" | perl -pe 's/\s+#(\d+?)[^0-9]+/$1/g' | read pr_id
  if [ $pr_id ]
    git remote show origin -n | grep 'Fetch URL:' | sed -e 's/  Fetch URL: //' | read fetch_url
    echo "$fetch_url/pull/$pr_id" | read pr_url
    open $pr_url
  end
end
