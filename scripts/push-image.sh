# Publishes a Docker image.

set -u # or set -o nounset
: "$APP_NAME"
: "$VERSION"
: "$REGISTRY_PW"

echo $REGISTRY_PW | docker login $APP_NAME.azurecr.io --username $APP_NAME --password-stdin

docker push $APP_NAME.azurecr.io/client:$VERSION
docker push $APP_NAME.azurecr.io/server:$VERSION