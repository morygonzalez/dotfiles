function peco_bundle_open
  bundle show 2> /dev/null | sed -e '/^  \*/!d; s/^  \* \([^ ]*\) .*/\1/' | peco --query "$LBUFFER" | read selected
  if [ $selected ]
    bundle open $selected
  end
  commandline -f repaint
end

