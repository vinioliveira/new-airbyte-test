metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Zv6moAt18uvPYc6BeDFYHiioTFZAdS7oHKHD5+J+F2w="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Zv6moAt18uvPYc6BeDFYHiioTFZAdS7oHKHD5+J+F2w="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:Zv6moAt18uvPYc6BeDFYHiioTFZAdS7oHKHD5+J+F2w="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:06SqQotbzdPTmi63SIWgA2JxOsP6Cb98p5TEv03dZcQ="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:nw91TOQgqiRtjgksB9lntPtVR4ktmQSlCHPsIbNmmTo="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:B8sOq3meaKXEiUw/I3Z6ToHrFBl33Q3LGXmcO80rFqo="
  retries = 2
  verbose = false
}
