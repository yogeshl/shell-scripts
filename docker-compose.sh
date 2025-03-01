#  confirm the latest version available @ https://github.com/docker/compose/releases

# Use the following command to download:
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.33.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

# set the correct permissions so that the docker compose command is executable:
chmod +x ~/.docker/cli-plugins/docker-compose

# verify that the installation was successful,
docker compose version
