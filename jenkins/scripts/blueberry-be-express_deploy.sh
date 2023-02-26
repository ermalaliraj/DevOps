sudo systemctl stop bbBackend
sudo cp -R /var/lib/jenkins/workspace/blueberry/be-express/be-express /home/ermal/projects/blueberry/be-express
sudo systemctl start bbBackend
sudo systemctl status bbBackend