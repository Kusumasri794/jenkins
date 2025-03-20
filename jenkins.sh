#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk maven -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
amazon-linux-extras install java-openjdk11 -y 
(or)
sudo yum install java-17-amazon-corretto
yum install jenkins -y
update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service


PORT CHANGING:
vim /usr/lib/systemd/system/jenkins.service

PASSWORDLESS LOGIN:
vim /var/lib/jenkins/config.xml

CHANGING BUILD LIMITS:
dashboard -- > manage jenkins -- > nodes -- > built-in node -- > configure -- > number of executors -- > 3 -- > save

RESTORING DELETE JOBS:
Dashboard -- > Manage Jenkins -- > Plugins -- > available plugins -- > Job Configuration History -- > install -- > go back to top page

Webhooks: it will trigger the build the moment we commit the code

github -- > repo -- > settings -- > webhooks -- > add webhook -- >
Payload URL: http://13.39.14.187:8080/github-webhook/ -- > Content type: application/json -- > Add webhook

Jenkins Dashboard -- > create ci job -- > Build triggers -- > GitHub hook trigger for  GITScm polling -- > save  

THROTTLE BUILD: to restrict number of builds per interval.
create job -- > Throttle builds -- > Number of build: 3 -- > time period: hours -- > save 

NOTE: PASSS 
P : PIPELINE
A : AGNET
S : STAGES
S : STAGE
S : STEPS

PIPELINE AS A CODE:
executing multiple commands or multiple actions on a single stage.

POST BUILD ACTIONS:
actions the we perform after the build is called as post build action.

always: if build failed or success it will run the post actions.
success: it will execute post actions only when the build is successful.
failure: it will execute post actions only when the build is failed.

RBAC: ROLE BASE ACCESS CONTROL

in real time to restrict the access for jenkins console we use rbac.
with rbac we can give set of limited permissions for user.

1. user:
dashboard -- > manage jenkins -- > users -- > create user (ramesh, suresh)

2. Plugin: 
Dashboard -- > Manage Jenkins -- >Plugins -- >available plugin  -- >Role-based Authorization Strategy -- >install

3. configure:
Dashboard -- > Manage Jenkins -- >security -- > security -- > Authorization -- > Role-based Authorization -- > save

4. manage and assign roles

Dashboard -- > Manage Jenkins -- >Manage and Assign Roles -- > Manage Role
role1: fresher -- > read
role2: exp -- > admin

ASSIGN ROLES

