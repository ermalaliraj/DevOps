sudo systemctl stop authJwt
sudo cp /var/lib/jenkins/workspace/auth-jwt-symmetric-demo/target/auth-jwt-symmetric-demo-0.0.1-SNAPSHOT.jar /home/ermal/projects/auth-jwt-symmetric-demo/
sudo systemctl start authJwt
sudo systemctl status authJwt