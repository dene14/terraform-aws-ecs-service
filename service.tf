resource "aws_ecs_service" "service_web_skeleton" {
  count = "${var.image == "amazon/amazon-ecs-sample" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${var.task_definition == "__NOT_DEFINED__" ? aws_ecs_task_definition.service.arn : var.task_definition}"
  desired_count = "${var.task_count}"
#  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

  lifecycle {
    ignore_changes = ["task_definition"]
  }

}

resource "aws_ecs_service" "service_web_managed" {
  count = "${var.image != "amazon/amazon-ecs-sample" ? 1 : 0}"
  name = "${var.environment}-${var.name}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count = "${var.task_count}"
#  iam_role = "${var.cluster_iam_role}"
#  depends_on = ["aws_iam_policy_attachment.ecs_service_ec2_role"]

}