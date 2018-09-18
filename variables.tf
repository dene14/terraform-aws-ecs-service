variable "name" {}

variable "cpu" { default = 10 }

variable "memory" { default = 512 }

variable "memory_reservation" { default = "__NOT_DEFINED__" }

variable "image" { default = "amazon/amazon-ecs-sample" }

variable "region" { default = "us-east-1" }

variable "vpc_id" {}

variable "environment" {}

variable "log_retention_days" {
    default = "7"
}

variable "cluster_iam_role" {}

variable "cluster_id" {}

variable "port_mappings" {
  type = "list"
  default = [
    { "containerPort" = "80" }
  ]
}

variable "entrypoint" {
  default = ""
}

variable "cmd" {
  type = "list"
  default = []
}

variable "environment_vars" {
  type = "map"
  default = {
    "__NOT_DEFINED__" = "__NOT_DEFINED__"
  }
}

variable "mount_points" {
  type = "list"
  default = [
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    },
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    },
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    }
  ]
}

variable "task_definition" {
  default = "__NOT_DEFINED__"
}

variable "task_count" { default = 1 }

