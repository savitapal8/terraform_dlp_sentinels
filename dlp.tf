provider "google" {
  access_token          = var.access_token
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

}
