resource "aws_iam_role" "service" {
  name = "${var.environment}-${var.name}"
  assume_role_policy = "${file("${path.module}/files/ecs-task-sts.json")}"
}

#resource "aws_iam_role_policy_attachment" "service-LICloudWatchLogger" {
#  role = "${aws_iam_role.service.name}"
#  policy_arn = "arn:aws:iam::${var.account_id}:policy/LICloudWatchLogger"
#}
