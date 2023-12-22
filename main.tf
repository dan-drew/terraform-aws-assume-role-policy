locals {
  assume_roles = {
    appautoscaling    = ["application-autoscaling.amazonaws.com"]
    backup            = ["backup.amazonaws.com"]
    cloudwatch_events = ["events.amazonaws.com"]
    ec2               = ["ec2.amazonaws.com"]
    ecs_host          = ["ecs.amazonaws.com", "ec2.amazonaws.com"]
    ecs_task          = ["ecs-tasks.amazonaws.com"]
    lambda            = ["lambda.amazonaws.com"]
    edgelambda        = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    redshift          = ["redshift.amazonaws.com"]
    firehose          = ["firehose.amazonaws.com"]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = local.assume_roles[var.type]
      type        = "Service"
    }
  }
}
