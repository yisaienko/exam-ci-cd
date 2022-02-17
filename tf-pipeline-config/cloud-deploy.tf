resource "null_resource" "delivery-pipeline-conf" {
  provisioner "local-exec" {
    command = "cd clouddeploy-config && gcloud deploy apply --file delivery-pipeline.yaml --region=us-central1"
  }
}

resource "null_resource" "target-dev-conf" {
  provisioner "local-exec" {
    command = "cd clouddeploy-config && gcloud deploy apply --file target-dev.yaml --region=us-central1"
  }
}

resource "null_resource" "target-stage-conf" {
  provisioner "local-exec" {
    command = "cd clouddeploy-config && gcloud deploy apply --file target-stage.yaml --region=us-central1"
  }
}

resource "null_resource" "target-prod-conf" {
  provisioner "local-exec" {
    command = "cd clouddeploy-config && gcloud deploy apply --file target-prod.yaml --region=us-central1"
  }
}
