module "dummy_ecs_task" {
  source = "../../my_modules/dummy_ecs_task"
  name = "${var.name}"
  cpu = "${var.cpu}"
  memory = "${var.memory}"
  memory_reservation = "${var.memory_reservation}"
  image = "${var.image}"
  port_mappings = "${var.port_mappings}"
  environment_vars = "${var.environment_vars}"
  entrypoint = "${var.entrypoint}"
  cmd = "${var.cmd}"
  log_driver = "awslogs"
  log_driver_options = {
    "awslogs-region" = "${var.region}",
    "awslogs-group" = "${var.environment}-${var.name}",
#    "awslogs-group" = "${aws_cloudwatch_log_group.service.name}", DOESN'T WORK FOR SOME REASON :(
  }
  mount_points = "${var.mount_points}"
}

resource "aws_ecs_task_definition" "service" {
#  count                 = "${var.task_definition == "__NOT_DEFINED__" ? 1 : 0}"
  family                = "${var.environment}-${var.name}"
  task_role_arn         = "${aws_iam_role.service.arn}"
  container_definitions = "[${module.dummy_ecs_task.container_definition}]"

  volume {
    name = "${format("vol-%d", 1) }"
    host_path = "${lookup(var.mount_points[0], "hostPath", "__NOT_DEFINED__" )}"
  }
  volume {
    name = "${format("vol-%d", 2) }"
    host_path = "${lookup(var.mount_points[1], "hostPath", "__NOT_DEFINED__" )}"
  }
  volume {
    name = "${format("vol-%d", 3) }"
    host_path = "${lookup(var.mount_points[2], "hostPath", "__NOT_DEFINED__" )}"
  }

}
