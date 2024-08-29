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

  sha     = "h1:2BL6T9T4XRh+KO28LEOcXSkF8Cia51594v4D0k7JgYw="
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

  sha     = "h1:2BL6T9T4XRh+KO28LEOcXSkF8Cia51594v4D0k7JgYw="
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

  sha     = "h1:2BL6T9T4XRh+KO28LEOcXSkF8Cia51594v4D0k7JgYw="
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

  sha     = "h1:jKcKdxwu73AZzoPMXQw+InglU9R5UYVE3OPr63MYcZI="
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

  sha     = "h1:Rp+YfrhqXvE172kdA1bI4ytXHgFOWmR3eDF7rq9sgNE="
  retries = 2
  verbose = false
}
