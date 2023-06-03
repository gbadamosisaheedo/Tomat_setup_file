Apache Tomcat server uses port 8080 by default hence create a new EC2 instance to avoid conflict and ensure that port 8080 is open on the security group.

SSH to your EC2 with your desired SSH client and follow these instructions carefully.

Step 1.

First thing is to update the repository using the following command

sudo apt update

Step 2

 Download Tomcat with the following command

sudo apt install tomcat9 tomcat9-admin -y

Step 3

 When the download is completed, Apache Tomcat Server will be installed automatically and will start up automatically.

You can also type the following command to check the status to confirm it is running

sudo systemctl status tomcat9

Press 'q' to exit from the terminal



Step4

sudo cp -r /usr/share/tomcat9-admin/* /var/lib/tomcat9/webapps/ -v



Step5

After installation is complete, Apache tomcat server starts automatically when ubuntu is restarted but you can enter the following command to ensure it is enabled as a startup item

sudo systemctl enable tomcat9



Step5

Test the server to confirm it is accessible by entering the IP address and the port in the browser

<public_ip>:8080


Step6

 Creating user

A new user account must be created to use apache tomcat web application manager.

To do this, open the tomcat-users.xml file using your preferred editor and add the users as shown below

sudo su

Then, lets remove the content of the users file:
echo > /etc/tomcat9/tomcat-users.xml



Using vim, we’ll update the file.

vim /etc/tomcat9/tomcat-users.xml



Carefully copy and paste the following to the vim.

 <?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
 <role rolename="manager-script"/>
<user username="tomcat" password="password" roles="manager-script"/>
<role rolename="admin-gui"/>
<role rolename="manager-gui"/>
<user username="tomcat1" password="password" roles="admin-gui,manager-gui"/>
</tomcat-users>

Step7:

 Save the file and exit enter
esc, then :x

Step9

Restart Apache tomcat server using the following commands

sudo systemctl restart tomcat9

Step10

 Once the server restarts, confirm by accessing the URL again using the port 8080

Please take note of the two password used in this setup.

username: tomcat1

password: password

Step9:
Paste the tomcat IP and port number on the browser, then click on manager webapp as shown below:


A login page will pop out, use the information below to login. You should see a page as shown below.

username: tomcat1

password: password

We’ll deploy our webapp to this tomcat server.

HOW TO COPY FROM THE SERVER TO THE LAPTOP

The objective here is that we want to copy the war file from our EC2 and upload to Tomcat server:
See steps below:


First, lets copy our war file from our EC2 to our Laptop.. we’ll use SCP command to do that:

scp -i yourKey.pem ubuntu@ec2-ip:~/.ssh/testrepo/target/RegistrationApp-1.2.war .

Example:

scp -i myKey.pem ubuntu@44.202.163.192:~/.ssh/testrepo/target/RegistrationApp-1.2.war .

There is other option to use winscp (For window users).

Make sure the file was downloaded to your laptop.

Thank you.
