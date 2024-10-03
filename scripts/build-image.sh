# Builds a Docker image.

set -u # or set -o nounset
: "$APP_NAME"
: "$VERSION"

docker build -t $APP_NAME.azurecr.io/client:$VERSION --file ./client/Dockerfile ./client
docker build -t $APP_NAME.azurecr.io/server:$VERSION --file ./server/Dockerfile ./server