# Cloud Build

`gcloud builds submit --project <cloud run name> --tag=eu.gcr.io/<image name>/helloworld:latest`

# Deploy

`gcloud run deploy app --project <project id> --image eu.gcr.io/<image name>/helloworld`

