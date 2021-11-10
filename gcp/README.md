### Sentinel file "threat_gcp_data_configuration_restriction.sentinel" is having code to deploy the policies. In order to deploy DLP through terraform, We need to validate below two policies successfully.
* Enforce jobs to have a trigger to ensure they run automatically.
* Enforce that all jobs save their findings into a BQ dataset.

## Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.

## Maps
* resourceTypesDLPJTMap: This is the map, being used to have path of node for the respective gcp service for Job  Trigger policy. Here Key is having complete path of particular node.

* resourceTypesDLPSFMap: This is the map, being used to have path of nodes for the respective gcp service for Save Finding policy. It is having two enteries with two keys "key" and "inspect_key". 
As per the policy, "inspect_job.0.actions.0.save_findings.0.output_config.0.table.0.dataset_id" needs to have appropriate value for the dataset_id.
As per terraform, inspect_job is not required section, so "inspect_job" & "dataset_id" both need to be validated for null/empty.

## Methods
* check_job_trigger: This function is being used to validate the value of parameter "recurrence_period_duration". As per the policy, its value needs to be lied between 1 day to 60 days. It can not be empty/null and will be sufficed with 's'. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
    
     address | The key inside of resource_changes section for particular GCP Resource in tfplan mock |
     rc | The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock |

* check_save_findings: This function is being used to validate the value of parameter "inspect_job.0.actions.0.save_findings.0.output_config.0.table.0.dataset_id". As per the policy, its value can not be null/empty and must be proper valid dataset_id. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters

    |address | The key inside of resource_changes section for particular GCP Resource in tfplan mock |
    |----|-----|-------|
    rc | The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock |
|Name|Email|Address|
|----|-----|-------|
|John|john@example.com|Address1|
