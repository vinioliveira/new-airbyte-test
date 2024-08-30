metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:GCP2ZAtL+ibZff5DjX+IDzW1eBrtUCl92Lx/Q8YU4a4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:GCP2ZAtL+ibZff5DjX+IDzW1eBrtUCl92Lx/Q8YU4a4="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:GCP2ZAtL+ibZff5DjX+IDzW1eBrtUCl92Lx/Q8YU4a4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:CAKNXoblDQqv/pz3LN4TN1Zkk+MruRVF6hFJSyyVcAo="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:QJzNafRcIWRU2+sMuD3q9AEYu0g850LEi1jTrT1fjAM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:H2vqoLeTBlsKQKG5a8CCzPIjkTdGqJDgqdaY26+57eg="
  retries = 2
  verbose = false
}
