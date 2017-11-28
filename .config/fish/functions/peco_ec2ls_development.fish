function peco_ec2ls_development
  ec2ls | grep 'dev' | peco --query "$argv" | awk -F\t '{print $4}' | tr -d '[:space:]' | read selected_host
  if [ $selected_host ]
    commandline "ssh webapp@$selected_host"
  else
    commandline ''
  end
end
