output "logging.group_name" {
  value = "${aws_cloudwatch_log_group.service.name}"
}

output "service.name" {
  value = "${var.name}"
}

output "service.environment" {
  value = "${var.environment}"
}

output "service.role" {
  value = "${aws_iam_role.service.name}"
}

