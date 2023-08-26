# Assign the provided parameters to variables
NAMESPACE=$1
DEPLOYMENT=$2
ROLLBACK_VERSION=$3

# Rollback the deployment
kubectl rollout undo deployment $DEPLOYMENT -n $NAMESPACE --to-revision=$ROLLBACK_VERSION

# Wait for the rollback to complete
kubectl rollout status deployment $DEPLOYMENT -n $NAMESPACE

# Check the status of the rollback
if [ $? -eq 0 ]; then
  echo "Rollback to revision $ROLLBACK_VERSION completed successfully."
else
  echo "Rollback failed."
fi
