# DevOps
Version 2
To run type: ansible-playbook flask_app_real.yml --become --become-user=user --ask-become-pass
flask_app_real.yml is the main playbook, others included as roles, flaskpy role is all about installing required python libs for Flask and configuring app on a remote host firewall role installs and configures ufw to allow only 22, 80, 443 ports
vars folder for variables
Flask app supports GET and POST methods with json type of data as a request containing emoji and count, responds with different number of emoji strings depending on count value
