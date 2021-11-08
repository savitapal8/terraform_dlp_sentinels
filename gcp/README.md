## Cloud DLP is a fully managed service designed to help you discover, classify, and protect your most sensitive data. It provides tools to classify, mask, tokenize, and transform sensitive elements to help you better manage the data that you collect, store, or use for business or analytics.


In order to deploy DLP through terraform, below two policies need to be run successfully.
* Enforce jobs to have a trigger to ensure they run automatically.
* Enforce that all jobs save their findings into a BQ dataset.

###threat_gcp_data_configuration_restriction.sentinel file is being used to have both policies as a code.
1. resourceTypesDLPJTMap
2. resourceTypesDLPSFMap

3. check_job_trigger
4. check_save_findings
5. Line# 92 && 113


triggers is required for planning.
schedule is not required for planning.
recurrence_period_duration is not required for planning.
recurrecne_period_duration with "" is fine for planning.
recurrence_period_download with null is fine for planning.
recurrence_period_download with "86400s" is perfect for sentinels.
