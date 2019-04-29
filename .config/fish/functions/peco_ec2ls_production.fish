function peco_ec2ls_production
  ec2ls | grep -v 'dev' | peco --query "$argv" | awk -F\t '{print $6 $3}' | read selected_host name
  echo $selected_host | tr -d '[:space:]' | read selected_host
  if [ $selected_host ]
    if string match -ir 'ECS' $name
      commandline "ssh ec2-user@$selected_host -i ~/.ssh/keys/yamap.pem"
    else if string match -ir 'redash' $name
      commandline "ssh ubuntu@$selected_host -i ~/.ssh/keys/yamap.pem"
    else
      commandline "ssh $selected_host"
    end
  else
    commandline ''
  end
end
