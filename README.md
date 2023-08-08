# Techdebug

Blog for TechDebug.com

Deployed via Github actions on `push` to `main` branch.

## Terraform

- Requires existing [S3 state bucket](https://github.com/lantrix/terraform-remote-state-s3-cloudformation)

### Remote state

Generate lockfile and commit it.

```shell
export accountId=$(aws sts get-caller-identity --query Account --output text)
terraform init \
    -backend-config="region=ap-southeast-2" \
    -backend-config="workspace_key_prefix=techdebug-com" \
    -backend-config="bucket=terraform-state-${accountId}" \
    -backend-config="key=techdebug-com-terraform.tfstate" \
    -backend-config="dynamodb_table=terraform-state"
```

## GitHub Actions

- Requires IAM role for GH Actions to be [setup before it will run](./iam-role/).

## GitHub Secrets

AWS Account ID must be published in GitHub secret `AWS_ACCOUNT_ID`

# Hugo Blog

Serve with `hugo serve`

Regen archive pages with:

```
pnpm install
pnpm generate-archives
```
