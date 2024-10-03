set -u # or set -o nounset
: "$APP_NAME"
: "$VERSION"
: "$MONGO_URL"
: "$JWT_SECRET"
: "$CLOUD_NAME"
: "$CLOUD_API_KEY"
: "$CLOUD_API_SECRET"

sed -i 's/\$APP_NAME/'$APP_NAME'/g' ./scripts/kubernetes/deployment.yaml
sed -i 's/\$VERSION/'$VERSION'/g' ./scripts/kubernetes/deployment.yaml

# Create Kubernetes secrets using GitHub Secrets
kubectl create secret generic app-secrets \
          --from-literal=mongo_url=$MONGO_URL }} \
          --from-literal=jwt_secret=$JWT_SECRET }} \
          --from-literal=cloud_name=$CLOUD_NAME }} \
          --from-literal=cloud_api_key=$CLOUD_API_KEY }} \
          --from-literal=cloud_api_secret=$CLOUD_API_SECRET }}

# Apply the Kubernetes deployment
kubectl apply -f ./scripts/kubernetes/deployment.yaml