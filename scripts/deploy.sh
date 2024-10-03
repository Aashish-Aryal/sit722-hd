set -u # or set -o nounset
: "$APP_NAME"
: "$VERSION"

sed -i 's/\$APP_NAME/'$APP_NAME'/g' ./scripts/kubernetes/deployment.yaml
sed -i 's/\$VERSION/'$VERSION'/g' ./scripts/kubernetes/deployment.yaml

# Apply the Kubernetes deployment
kubectl apply -f ./scripts/kubernetes/deployment.yaml