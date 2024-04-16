module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  tags = {
    cluster = "demo"
  }

  vpc_id = module.vpc.vpc_id

  # The user which you used to create cluster will get admin access
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    blue = {
      min_size      = 2
      max_size      = 3
      desired_size  = 2
      capacity_type = "SPOT"
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy          = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonElasticFileSystemFullAccess = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
        AmazonEC2FullAccess               = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      }
    }

    # green = {
    #   min_size      = 2
    #   max_size      = 3
    #   desired_size  = 2
    #   capacity_type = "SPOT"
    #   iam_role_additional_policies = {
    #     AmazonEBSCSIDriverPolicy          = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    #     AmazonElasticFileSystemFullAccess = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
    #     AmazonEC2FullAccess               = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    #   }
    # }
  }
}

