module "asg11" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "harsh-asg"

  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = ["${aws_subnet.harsh-viradia-1-subnet1.id}", "${aws_subnet.harsh-viradia-1-subnet2.id}"]
  target_group_arns         = module.alb1.target_group_arns

  launch_template_name   = "harsh-viradia-public"
  image_id               = data.aws_ami.amazon_linux.id
  update_default_version = true
  instance_type          = "t2.micro"
  enable_monitoring      = true
  ebs_optimized          = false
  security_groups        = [module.web_security_group.security_group_id]

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]

  #  IAM Role & Instance Profile
  # create_iam_instance_profile = true
  # iam_role_name               = "harsh-viradia-ec2-ssm"
  # iam_role_path               = "/ec2/"
  # iam_role_description        = "IAM role ec2 SSM"
  # iam_role_tags = {
  #   CustomIamRole = "Yes"
  # }
  # iam_role_policies = {
  #   AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  # }

  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name  = "harsh-viradia",
        Owner = "harsh.viradia@intuitive.cloud"
      }
    }
  ]
}
