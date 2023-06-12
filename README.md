# Techdebug

Blog for TechDebug.com

Deployed via Github actions on `push` to `main` branch.

## Terraform

 - Requires existing [S3 state bucket](https://github.com/lantrix/terraform-remote-state-s3-cloudformation)
### GitHub Actions

- Requires IAM role for GH Actions to be [setup before it will run](./iam-role/).

### GitHub Secrets

AWS Account IF must be published in GitHub secret `AWS_ACCOUNT_ID`
