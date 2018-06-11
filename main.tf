resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.role_name}"
  role = "${aws_iam_role.role.name}"
}

resource "aws_iam_policy" "policy" {
  name = "${var.role_name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::${var.account_id}:role/${var.assumed_role_name}"
    }
  ]
}
EOF
}

resource "aws_iam_role" "role" {
  name = "${var.role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "${var.service}"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachment" {
    role       = "${aws_iam_role.role.name}"
    policy_arn = "${aws_iam_policy.policy.arn}"
}

