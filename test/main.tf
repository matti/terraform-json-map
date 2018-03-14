locals {
  json = {
    string  = "hello"
    number  = 3
    boolean = true

    array = [
      1,
      2,
      3,
    ]

    nested = {
      string = "nested hello"
    }
  }
}

module "json2map_root" {
  source = ".."

  json = "${jsonencode(local.json)}"
}

output "root" {
  value = "${module.json2map_root.map}"
}
