.PHONY: ssh
ssh: ## ssh
	ssh -i ./.vagrant/machines/fuji-02/virtualbox/private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@fuji-02
