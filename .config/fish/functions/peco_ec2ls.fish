function peco_ec2ls
  ec2ls | peco --query "$argv" | awk -F\t '{print $5}' | read selected_host
  # ec2ls | expand | peco --query "$argv" | awk '{print $5}' | read selected_host
  if [ $selected_host ]
    commandline "ssh $selected_host"
  else
    commandline ''
  end
end
