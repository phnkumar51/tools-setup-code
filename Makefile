00infra:
	git pull
	terraform init
	terraform apply -auto-approve
#code

ansible:
	git pull
	#ansible-playbook -i $(tool_name)-internal.bdevops.online, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name) #-e vault_token=$(vault_token)
    ansible-playbook -i $(tool_name).bdevops.online, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name)