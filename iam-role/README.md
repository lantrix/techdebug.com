# Setup IAM role

## Deploy OIDC Provider

> **Note**
> This is needed only once per AWS account

The GitHub OIDC Provider only needs to be created once per account (i.e. multiple IAM Roles that can be assumed by the GitHub's OIDC can share a single OIDC Provider).

```shell
make deploy-oidc
```

## Deploy Actions Role

Deploy the CFN stack for the IAM role. Parameters are:
  - ARN for the created OIDC provider.
  - ARN of the Terraform State managed policy
    - The ARN is in the output key `PolicyARN` from the `terraform-state-managed-policy` stack in `ap-southeast-2`
      - The stack was deployed by `make deploy-policy` alongside the [terraform S3 state](https://github.com/lantrix/terraform-remote-state-s3-cloudformation/tree/main)


```shell
make deploy account=123456789012 zone=ZZT42IIGUVDMRF
```
