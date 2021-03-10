# DevOps
Version 2

flask_app_real.yml is the main playbook, others included as roles<br />

flaskpy role is all about installing required python libs for Flask and configuring app on a remote host; firewall role installs and configures ufw to allow only 22, 80, 443 ports<br />

vars folder for variables<br />

Flask app supports GET and POST methods with json type of data as a request containing emoji and count, responds with different number of emoji strings depending on count value<br />
To test app with POST method type: `curl -H "Content-Type: application/json" -X POST -d'{"word" : "mice", "count" : 5}' http://localhost/emoji`<br />
`-H` option indicates the type of data being sent in the request body<br />
`-d` option indicates the data to include in the body of the request, **mice** is emoji, **word** is a key for it, **count** is for how many times emoji should appear

To run type: `ansible-playbook flask_app_real.yml --become --become-user=user --ask-become-pass` where `user` is the remote user in sudoers file, `--ask-become-pass` option means the password is required, `--become` tells Ansible to become another user, wl in this case
