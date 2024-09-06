metadata {
  path = "ingress-nginx"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:XFpLthDBfHm6gw3/ExbzJ4Y42Eu+SiEQVa/a7/1R5cs="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:XFpLthDBfHm6gw3/ExbzJ4Y42Eu+SiEQVa/a7/1R5cs="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ingress-nginx",
  ]

  sha     = "h1:XFpLthDBfHm6gw3/ExbzJ4Y42Eu+SiEQVa/a7/1R5cs="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:uPSZhg/uRAIkpLfndYZ7KejGW71hbLtveT2Qyf19kOk="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ingress-nginx",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ingress-nginx",
  ]

  sha     = "h1:CV3ZHWGUrr6kxn0PBR9FKAFi0I3us7jl8pHCJyD2SNg="
  retries = 2
  verbose = false
}
