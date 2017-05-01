function peco_ec2ls
  ec2ls | expand | peco --query "$argv" | awk '{print $6}' | read selected_host
  if [ $selected_host ]
    commandline "ssh $selected_host"
  else
    commandline ''
  end
end
