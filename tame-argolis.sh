#!/bin/bash
export project_id='<ADD PROJECT ID>'
 
yaml_string="constraint: constraints/compute.vmExternalIpAccess\nlistPolicy:\n    allValues: ALLOW"
> config.yaml
echo -e $yaml_string | tee -a config.yaml
gcloud beta resource-manager org-policies set-policy --project=$project_id config.yaml
 
> config.yaml
yaml_string="constraint: constraints/iam.allowedPolicyMemberDomains\nlistPolicy:\n     allValues: ALLOW"
echo -e $yaml_string | tee -a config.yaml
gcloud beta resource-manager org-policies set-policy --project=$project_id config.yaml
 
> config.yaml
yaml_string="constraint: constraints/iam.disableServiceAccountKeyCreation\nbooleanPolicy:\n     enforced: FALSE"
echo -e $yaml_string | tee -a config.yaml
gcloud beta resource-manager org-policies set-policy --project=$project_id config.yaml
 
> config.yaml
yaml_string="constraint: constraints/compute.requireOsLogin\nbooleanPolicy:\n     enforced: FALSE"
echo -e $yaml_string | tee -a config.yaml
gcloud beta resource-manager org-policies set-policy --project=$project_id config.yaml
 
> config.yaml
yaml_string="constraint: constraints/compute.requireShieldedVm\nbooleanPolicy:\n     enforced: FALSE"
echo -e $yaml_string | tee -a config.yaml
gcloud beta resource-manager org-policies set-policy --project=$project_id config.yaml
