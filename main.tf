variable "depends_id" {
  default = ""
}

variable "json" {}

resource "null_resource" "start" {
  triggers {
    depends_id = "${var.depends_id}"
  }
}

data "external" "json2map" {
  depends_on = ["null_resource.start"]

  program = ["ruby", "${path.module}/json2map.rb"]

  query = {
    json = "${var.json}"
  }
}

output "map" {
  value = "${data.external.json2map.result}"
}
