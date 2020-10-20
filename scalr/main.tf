terraform {
  backend "remote" {
    hostname = "4d78f24a54c9.test-env.scalr.com"
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhdC1zdnN1ZTEzaTdudnNhcG8iLCJpc3MiOiJ1c2VyIn0.PEnF4h-eaXlQmjOE8MWsS098b3KwcB7KU6wDKTnfn2I"
    organization = "env-svrcnchebt61e30"
    workspaces {
      name = "testremote"
    }
  }
}

provider "scalr" {
  hostname = "4d78f24a54c9.test-env.scalr.com"
  token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhdC1zdnJka2tqYTFncWwwOW8iLCJpc3MiOiJ1c2VyIn0.p2LHA_d7t93et1XuNI18R5eieq_NRrjYbUfNIRfcYL0"
}

resource "scalr_workspace" "testws1" {
  name = "scalr1"
  environment_id = "env-svrcnchebt61e30"
}

resource "random_string" "r" {
  length = 16
}

resource "scalr_endpoint" "url1" {
  name = "endpoint1"
  secret_key = random_string.r.result
  timeout = 15
  max_attempts = 4
  url = "https://revizor.scalr-labs.net/webhooks/classic"
  environment_id = "env-svrcnchebt61e30"
}
resource "scalr_webhook" "hook1" {
  enabled = true
  name = "wh2"
  events = [
    "run:completed",
    "run:needs_attention"]
  endpoint_id = scalr_endpoint.url1.id
  workspace_id = scalr_workspace.testws1.id
  environment_id = "env-svrcnchebt61e30"
}

data "scalr_current_run" "testrun" {
}

output "run_id" {
    value = data.scalr_current_run.testrun.id
}

output "vcs" {
    value = data.scalr_current_run.testrun.vcs
}

output "env_id" {
    value = data.scalr_current_run.testrun.environment_id
}

output "ws_name" {
    value = data.scalr_current_run.testrun.workspace_name
}

output "is_destroy" {
    value = data.scalr_current_run.testrun.is_destroy
}

output "message" {
    value = data.scalr_current_run.testrun.message
}

