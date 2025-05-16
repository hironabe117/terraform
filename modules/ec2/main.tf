
resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_iam_role" "ssm_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = var.ssm_policy_arn
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ssm_role.name
}

resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.deployer.key_name
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  vpc_security_group_ids = [var.sg_id]

  tags = { Name = var.ec2_name }
}
