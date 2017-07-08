function peco_ec2ls
  ec2ls | peco --query "$argv" | awk -F\t '{print $6}' | expand | read selected_host
  # ec2ls | expand | peco --query "$argv" | awk -F"  " '{print $4}' | read selected_host
  if [ $selected_host ]
    commandline "ssh $selected_host"
  else
    commandline ''
  end
end
