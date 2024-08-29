metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:2g3n/JKfHuEXjBAhRrMrap/GHkKR/ugkmlWCRd04p+Y="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:2g3n/JKfHuEXjBAhRrMrap/GHkKR/ugkmlWCRd04p+Y="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:2g3n/JKfHuEXjBAhRrMrap/GHkKR/ugkmlWCRd04p+Y="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:TGGbHTzuaoA4ao2S9/0e37Q+nx0ufCAPXrR2nfZUAds="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:+yLsp3xyJDd0FY8Z+NRMrFzplLhv0IoKkPdynOfpk2E="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:2YWZmcTLiOQj8Vmf0NreyAlcRhAxPRkVB1xbDphiO+A="
  retries = 2
  verbose = false
}
