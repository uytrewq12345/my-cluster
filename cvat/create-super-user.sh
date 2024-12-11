#!/bin/bash

HELM_RELEASE_NAMESPACE="cvat" &&\
HELM_RELEASE_NAME="cvat" &&\
BACKEND_POD_NAME=$(kubectl get pod --namespace $HELM_RELEASE_NAMESPACE -l tier=backend,app.kubernetes.io/instance=$HELM_RELEASE_NAME,component=server -o jsonpath='{.items[0].metadata.name}') &&\
kubectl exec -it --namespace $HELM_RELEASE_NAMESPACE $BACKEND_POD_NAME -c cvat-backend -- python manage.py createsuperuser
