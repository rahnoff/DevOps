# Jenkins CI/CD
# java_hello

I use Debian 10

Jenkins is an open source automation server. It can be installed as a systemd service or a Docker container. I use the first method. Jenkins requires Java to be installed, install it by typing `sudo apt install default-jdk`, then:<br />
- `wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -`<br />
- `sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`<br />
- `sudo apt update`<br />
- `sudo apt install jenkins`<br />
- `sudo systemctl start jenkins`<br />
- `sudo systemctl enable jenkins`<br />

After that open Jenkins in the browser: **http://localhost:8080**, Jenkins should ask for the administrator password, in a terminal enter `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`, copy the code and paste it in the browser, click **Continue**. After accepting the password, Jenkins asks whether to install suggested plugins, click **Install suggested plugins**. The next section is **Create First Admin User**, fill in the required information and click **Save** and **Continue**<br />

Spring Boot app listens on 8080 port and prints **Hello World 2** to the browser. Dockerfile builds the image with Java Spring Boot app, Jenkinsfile then starts it locally as a docker container. To install Docker please refer to **https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10**
