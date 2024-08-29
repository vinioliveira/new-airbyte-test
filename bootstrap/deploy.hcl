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

  sha     = "h1:iEKW0VHRZLN5hUINEavbRCGvyNrIhuTPrlkGln3OjFU="
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

  sha     = "h1:iEKW0VHRZLN5hUINEavbRCGvyNrIhuTPrlkGln3OjFU="
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

  sha     = "h1:iEKW0VHRZLN5hUINEavbRCGvyNrIhuTPrlkGln3OjFU="
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

  sha     = "h1:8rytt3RXat/qPAykNxwDaqpHdrrojXhgU9nHk65s2hc="
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

  sha     = "h1:9kXprI77+DV6OkYX/QcfUGKxkT8Msjg8U1DbE49SICY="
  retries = 2
  verbose = false
}
