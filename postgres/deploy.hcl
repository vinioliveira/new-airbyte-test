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

  sha     = "h1:4QjvXOT++lf3JqCu50fHIQf+wIKtqx5cWuNIEA65XQg="
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

  sha     = "h1:4QjvXOT++lf3JqCu50fHIQf+wIKtqx5cWuNIEA65XQg="
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

  sha     = "h1:4QjvXOT++lf3JqCu50fHIQf+wIKtqx5cWuNIEA65XQg="
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

  sha     = "h1:h36VRq6IRyFQy3u9gg9E+UJCRgG53AtWW/QAWSDDiEg="
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

  sha     = "h1:tfxO+RvFRpCFpj1ps4D9oeJrnH/SRVYXwQDJ06Yq5Zk="
  retries = 2
  verbose = false
}
