#Google Cloud Deploy uses Skaffold for render and deploy operations. Google Cloud Deploy requires only a Skaffold configuration that identifies the manifests to render and apply. You don't need to install Skaffold. It's included as part of Google Cloud Deploy.

#Skaffold is a command-line tool that enables continuous development for Kubernetes-native applications.
-It gives you discrete control of CI/CD pipeline activities (build, render, test deploy).
-Skaffold profiles let you differentiate among different environments, with different build, test, and deploy configurations, all in the same configuration file.
-Skaffold performs healthchecks, and Google Cloud Deploy uses them.
-Using Skaffold allows Google Cloud Deploy to separate delivery pipeline definition from render details. This separation lets you experiment with your manifests without disrupting the delivery pipeline.
-The rendering source plus your containers are use to generate rendered manifests.

#How does Google Cloud Deploy use Skaffold?
-The rendering source and references to container images are passed to Google Cloud Deploy when you create a release.
-As part of release creation, Google Cloud Deploy calls Cloud Build, which, in turn, invokes skaffold diagnose and skaffold render to render the manifest or manifests using that rendering source and those images.
-When deploying, Google Cloud Deploy calls skaffold apply to apply the rendered manifest or manifest to the target cluster.

#Skaffold builders: https://skaffold.dev/docs/pipeline-stages/builders/
#Skaffold deployers: https://skaffold.dev/docs/pipeline-stages/deployers/

#Google Cloud Deploy creates a rollout for the release into the destination target, and the release is queued for deployment. When it's deployed, the delivery pipeline visualization shows that fact.

#Google Cloud Deploy uses Pub/Sub to publish notifications for actions with:
-gcloud pubsub topics create clouddeploy-resources
-gcloud pubsub topics create clouddeploy-operations
-gcloud pubsub topics create clouddeploy-approvals
notif and subscriptions: https://cloud.google.com/pubsub/docs/admin

#Can add annotations to delivery-pipeline, targets or realese creating, the --annotations= flag lets you apply one or more arbitrary key-value pairs to the release that this command creates.

#For Cloud Deploy now you must create targets, releases, and rollouts in the same region in which you created the delivery pipeline. (The GKE clusters represented by those targets, however, can be in any region). EU only one region now - europe-west1
Can check https://cloud.google.com/about/locations

https://cloud.google.com/kubernetes-engine/docs/concepts/release-channels