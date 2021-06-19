# Cloudbuild

`gcloud builds submit --project cloudrun-bumpbot9000 --tag eu.gcr.io/cloudrun-bumpbot9000/helloworld:latest`

# Deploy

`gcloud run deploy app --project cloudrun-bumpbot9000 --image eu.gcr.io/cloudrun-bumpbot9000/helloworld`



