1. Developer pushes app to GitHub

2. Push to GitHub Triggers Cloud Build (with premade "trigger" function)

3. Cloud Build building and testing container by premade "cloudbild.yaml" config rules

4. Cloud Build pushing build to Contaiber Registry and run's security scan

5. Cloud Build calls Google Cloud Deploy, in case using "cloudbild.yaml" rules. Config calls to create a new release, it automatically creates and deploys a rollout to the first "target" -> "dev" cluster 

6. When a new release is created, Cloud Deploy does the following:

	6.1. Stores an instance of the delivery pipeline as part of the release

	6.2. This pipeline instance remains unchanged for this release, even if the delivery pipeline configuration is changed

	6.3. Cloud Deploy stores the rendering source in the default or alternate Cloud Storage bucket

	6.4. Cloud Deploy substitutes image names with the full image paths (including digests or tags) provided on the gcloud deploy releases create command

	6.5. Cloud Deploy stores the rendered manifest in the default or alternate Cloud Storage bucket

	6.6. If the target requires approval, u can approve or reject through the CLI

	6.7. Cloud Deploy uses Skaffold tool to render ur Kubernetes manifests and "skaffold.yaml" is mandatory manifest to deploy trough Cloud Deploy.

	Main preferences Skaffold: 

	-Separate rendering tools from the delivery pipeline. This separation lets u experiment with ur manifests without disrupting the delivery pipeline.

	-Skaffold performs healthchecks, and Google Cloud Deploy uses them

	-Skaffold substitutes the image references in the manifest with the images u want to deploy in ur release.
	
7. After successful rollout to first target u can promote relese to next target -> "stage" cluster (in case)

8. Then promote to "prod" cluster (with approval)

9. After approval and completing rollout of ur release, deployment through all pipeline successful.