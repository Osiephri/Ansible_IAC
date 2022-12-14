resource "aws_eks_node_group" "Ansible_node" {
  cluster_name    = var.clustername
  node_group_name = var.nodegroupname
  node_role_arn   = aws_iam_role.Ansible_node.arn
  subnet_ids      = ["subnet-00f882502a1585aed", "subnet-0f7dd8c02c7b3701f"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.Ansible_node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.Ansible_node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.Ansible_node-AmazonEC2ContainerRegistryReadOnly,
  ]
}



resource "aws_iam_role" "Ansible_node" {
  name = "Ansible_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment"  "Ansible-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eksnoderole.name
}

resource "aws_iam_role_policy_attachment"  "Ansible-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eksnoderole.name
}

resource "aws_iam_role_policy_attachment"  "Ansible-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eksnoderole.name
}