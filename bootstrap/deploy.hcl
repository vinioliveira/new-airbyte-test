metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:L1EZnan6ifDWA1iCeDmgHPR0jnEnYbtcoY5TAU/uPZg="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:L1EZnan6ifDWA1iCeDmgHPR0jnEnYbtcoY5TAU/uPZg="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:kMHPgdt4+Q5sNw6bPbb4BGsQeC4890jzxP10c6lQdDM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:F1ppDpWZRSfYZ8oy+3l9sHtT5jPb1hvGdVFSx2dvSMY="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:hKsVLjNo0HTHkNN+cfOTrLjTwNWU/Rwp2Wk0Vkvzsrc="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:RLwRvV9zXjmECx30Z8PiLNfUPg6r6zswrfTzSlqLDpw="
  retries = 2
  verbose = false
}
