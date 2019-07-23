function peco_ec2ls_development
  ec2ls | grep 'dev\|feature' | peco --query "$argv" | awk -F\t '{print $4 $3}' | read selected_host name
  echo $selected_host | tr -d '[:space:]' | read selected_host
  if [ $selected_host ]
    if string match -ir '(ECS|gyazo|feature)' $name
      commandline "ssh ec2-user@$selected_host -i ~/.ssh/keys/yamap.pem"
    else
      commandline "ssh webapp@$selected_host"
    end
  else
    commandline ''
  end
end
