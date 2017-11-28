function peco_ec2ls_production
  ec2ls | grep -v 'dev' | expand | peco --query "$argv" | awk '{print $7}' | tr -d '[:space:]' | read selected_host
  if [ $selected_host ]
    commandline "ssh $selected_host"
  else
    commandline ''
  end
end
