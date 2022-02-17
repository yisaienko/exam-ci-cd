KUBERNETES_DIR=${HOME}/Desktop/exam/gke-namespaces

export PROJECT_ID=$(gcloud config get-value core/project)
export REGION=$(gcloud config get-value compute/region)

manage_gke_contexts() {
    # Ensures GKE cluster contexts are isntalled as easy to use names

    echo "Setting GKE contexts"
    gcloud container clusters get-credentials dev --region ${REGION}
    kubectl config delete-context dev > /dev/null 2>&1
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_dev dev

    gcloud container clusters get-credentials stage --region ${REGION}
    kubectl config delete-context stage > /dev/null 2>&1
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_stage stage

    gcloud container clusters get-credentials prod --region ${REGION}
    kubectl config delete-context prod > /dev/null 2>&1
    kubectl config rename-context gke_${PROJECT_ID}_${REGION}_prod prod
    echo "Done"
}

manage_gke_namespaces() {
    # Create a namespace in each cluster
    echo "Creating Kubernetes namespaces"

    cd ${KUBERNETES_DIR}

    CONTEXTS=("dev" "stage" "prod")

    for CONTEXT in ${CONTEXTS[@]}
    do
      kubectl --context ${CONTEXT} apply -f ${KUBERNETES_DIR}/
    done

    echo "Done"
}

manage_gke_contexts
manage_gke_namespaces