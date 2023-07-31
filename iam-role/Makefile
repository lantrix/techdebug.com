stack_name                := github-actions-techdebug-role
oidc_stack_name           := github-oidc-provider
stack_region              := ap-southeast-2
no_color                  := \033[0m
ok_color                  := \033[32;01m

ifndef account
$(error account is not set)
endif

.PHONY: deploy-oidc
deploy-policy: $(workspace)
	@echo "\n$(ok_color)====> Deploying GitHub OIDC stack$(no_color)"
	aws cloudformation deploy \
		--stack-name $(oidc_stack_name) \
		--template-file github-oidc-provider.template \
		--region $(stack_region) \
		--no-fail-on-empty-changeset

.PHONY: deploy
deploy: $(workspace)
	@echo "\n$(ok_color)====> Deploying Techdebug GhActions IAM role stack$(no_color)"
	aws cloudformation deploy \
		--stack-name $(stack_name) \
		--template-file github-actions-techdebug-role.template \
		--capabilities CAPABILITY_NAMED_IAM \
		--region $(stack_region) \
		--parameter-overrides \
		AWSAccountID=$(account) \
		OIDCProviderArn="arn:aws:iam::$(account):oidc-provider/token.actions.githubusercontent.com" \
		RemoteStateManagedPolicy="arn:aws:iam::$(account):policy/terraform-state-policy" \
		--no-fail-on-empty-changeset
