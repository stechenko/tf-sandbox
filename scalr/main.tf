provider "scalr" {
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
  name = "wh1"
  events = [
    "run:completed",
    "run:needs_attention"]
  endpoint_id = scalr_endpoint.url1.id
  workspace_id = scalr_workspace.testws1.id
  environment_id = "env-svrcnchebt61e30"
}
