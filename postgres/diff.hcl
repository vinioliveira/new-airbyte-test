metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
