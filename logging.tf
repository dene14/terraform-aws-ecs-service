resource "aws_cloudwatch_log_group" "service" {
  name = "${var.environment}-${var.name}"
  retention_in_days = "${var.log_retention_days}"
}
