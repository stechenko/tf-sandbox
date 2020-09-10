provider "scalr" {
}

resource "scalr_workspace" "testws1" {
  name = "scalr1"
  environment_id = "env-svrcnchebt61e30"
}
