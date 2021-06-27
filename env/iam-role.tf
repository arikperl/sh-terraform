##Create policy for SQS
#######################
module "iam_policy_sqs" {
  source           = "../modules/aws-iam-role/iam-policy"

  name             = "POLICY-SQS-${var.tg_suffix}"
  description      = "Allow ${var.env_suffix} env to pull messages"
  policy    = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "sqs:DeleteMessage",
                "sqs:GetQueueUrl",
                "sqs:ListQueues",
                "sqs:ChangeMessageVisibility",
                "sqs:SendMessageBatch",
                "sqs:UntagQueue",
                "sqs:ReceiveMessage",
                "sqs:SendMessage",
                "sqs:GetQueueAttributes",
                "sqs:ListQueueTags",
                "sqs:TagQueue",
                "sqs:ListDeadLetterSourceQueues",
                "sqs:DeleteMessageBatch",
                "sqs:PurgeQueue",
                "sqs:DeleteQueue",
                "sqs:CreateQueue",
                "sqs:ChangeMessageVisibilityBatch",
                "sqs:SetQueueAttributes"
            ],
            "Resource": "arn:aws:sqs:us-east-2:101715011694:*-${var.env_suffix}.fifo"
        }
    ]
})
}

##Create policy for Eventbridge
#######################
module "iam_policy_event_bus" {
  source           = "../modules/aws-iam-role/iam-policy"

  name             = "POLICY-EVENTBUS-${var.tg_suffix}"
  description      = "Allow ${var.env_suffix} env to put events"
  policy    = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "events:PutEvents",
            "Resource": "arn:aws:events:us-east-2:101715011694:event-bus/bond-${var.env_suffix}"
        }
    ]
})
}

##Create role for cluster including policy
##########################################
module "iam_role_cluster" {
  source    = "../modules/aws-iam-role/iam-role"

  name      = "EKS-CLUSTER-ROLE-${var.tg_suffix}"
  policy    = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})
}

module "iam_role_cluster_policy_attachment" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"

    policy_arn    = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role          = module.iam_role_cluster.this_iam_role_name
}
module "iam_role_cluster_policy_attachment_sqs" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"

    policy_arn    = module.iam_policy_sqs.this_iam_policy_arn
    role          = module.iam_role_cluster.this_iam_role_name
}
##Create role for cluster-nodegroup including policy
###################################################

module "iam_role_cluster_nodegroup" {
  source    = "../modules/aws-iam-role/iam-role"

  name      = "EKS-CLUSTER-NODEGROUP-ROLE-${var.tg_suffix}"
  policy    = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})
}

module "iam_role_cluster_nodegroup_policy_attachment_worker" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role          = module.iam_role_cluster_nodegroup.this_iam_role_name
}
module "iam_role_cluster_nodegroup_policy_attachment_cni" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role          = module.iam_role_cluster_nodegroup.this_iam_role_name
}
module "iam_role_cluster_nodegroup_policy_attachment_ecr" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role          = module.iam_role_cluster_nodegroup.this_iam_role_name
}
module "iam_role_cluster_nodegroup_policy_attachment_sqs" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"
    policy_arn    = module.iam_policy_sqs.this_iam_policy_arn
    role          = module.iam_role_cluster_nodegroup.this_iam_role_name
}
module "iam_role_cluster_nodegroup_policy_attachment_eventbridge" {
    source        = "../modules/aws-iam-role/iam-role-policy-attachment"
    policy_arn    = module.iam_policy_event_bus.this_iam_policy_arn
    role          = module.iam_role_cluster_nodegroup.this_iam_role_name
}