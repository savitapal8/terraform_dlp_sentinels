provider "google" {

}

resource "google_data_loss_prevention_job_trigger" "savita_demo_1" {
    parent = "airline1-sabre-wolverine"
    description = "Description"
    display_name = "Displayname"

    triggers {
        schedule {
            recurrence_period_duration = "86400s"
        }
    }

    inspect_job {
        inspect_template_name = "savita_demo_1"
        actions {
            save_findings {
                output_config {
                    table {
                        project_id = "airline1-sabre-wolverine"
                        dataset_id = "dlp_demo"
                    }
                }
            }
        }
        storage_config {
            cloud_storage_options {
                file_set {
                    url = "gs://my_bucket_df/"
                }
            }
        }
    }
}