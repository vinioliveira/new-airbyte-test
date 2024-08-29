metadata {
  path = "airbyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:qCEcfDHS4P0naox/lnp+WW6PyXZ0ObbM82bG8AKlFf4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:qCEcfDHS4P0naox/lnp+WW6PyXZ0ObbM82bG8AKlFf4="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "airbyte"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "airbyte",
  ]

  sha     = "h1:qCEcfDHS4P0naox/lnp+WW6PyXZ0ObbM82bG8AKlFf4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:utKevg7aVAHYEkdmqEkti6dsyu0CMOm63kEom3w7Aqk="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "airbyte"
  target  = "airbyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airbyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "airbyte"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airbyte",
  ]

  sha     = "h1:FCqTRTjaoQNGmpel0aOXBsCdRs411rHbDhV5xZRDdLk="
  retries = 2
  verbose = false
}
