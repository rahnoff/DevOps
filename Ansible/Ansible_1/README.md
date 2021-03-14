# Flask App with Ansible

Install Ansible by `sudo apt install ansible`

In **/etc/hosts** add an IP address and name of the managed Ansible host, in **/etc/ansible/hosts** add name of the managed Ansible host<br />

To use playbook make ssh pair of keys by typing `ssh-keygen` at Ansible host, then type `ssh-copy-id user_on_managed_host@name_of_managed_host`<br />

**flask_app_real.yml** is the main playbook, others included as roles<br />

**HTTPS** requires certificates, self-signed certificates in this case, to generate key and cert install OpenSSL by typing `sudo apt install openssl`, then type `sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout name_of_current_dir/nginx-selfigned.key -out name_of_current_dir/nginx-selfsigned.crt`, answers to questions may be arbitrary, for **commom name** answer localhost. File with .crt extension has root as user and group owner, change ownership to local non-root user by `sudo chown user_name nginx-selfsigned.crt`, `sudo chown :group_name_of_user_name nginx-selfisigned.crt` and `chmod g+r nginx-selfisigned.crt`, `chmod o+r nginx-selfisigned.crt`, then move them to ansible folder from which ansible playbook runs<br />

**flaskpy** role is all about installing required python libs for Flask and configuring app on a remote host; **firewall** role installs and configures ufw to allow only 22, 8080, 443 ports, **ssh_configuration** role adds the remote user to sudoers and disables root login, **systemd_config** role creates a unit to start the app at boot, **nginx_config** installs **NGINX** and configures it to serve as an HTTPS proxy to Flask app<br />

**vars** folder for variables<br />

Flask app supports GET and POST methods with json type of data as a request containing emoji and count, responds with different number of emoji depending on count value<br />

To test app with POST method type: `curl -k -H "Content-Type: application/json" -X POST -d'{"word" : "wolf", "count" : 5}' https://name_of_managed_host/emoji`<br />
`-k` option is for ignoring self-signed certs, by default curl doesn't work with them<br />
`-H` option indicates the type of data being sent in the request body<br />
`-X POST` - POST method<br />
`-d` option indicates the data to include in the body of the request, **wolf** is emoji, **word** is a key for it, **count** is for how many times emoji should appear<br />
For GET method with Flask greetings type `curl -k https://name_of_managed_host/`<br />

To run the playbook type: `ansible-playbook flask_app_real.yml --become --become-user=user --ask-become-pass` where `user` is the remote user in sudoers file, `--ask-become-pass` option means the password is required, `--become` tells Ansible to become another user, root in this case
