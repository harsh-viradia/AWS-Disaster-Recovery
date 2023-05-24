data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }
}

data "aws_ami" "amazon_linux-2" {
  provider = aws.region2
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }
}

data "aws_route53_zone" "private_zone" {
  name         = "dns-poc-onprem.tk"
  private_zone = true
}


data "aws_route53_zone" "public_zone" {
  name         = "dns-poc-onprem.tk"
  private_zone = false
}

data "aws_acm_certificate" "https_certificate" {
  domain   = "dns-poc-onprem.tk"
  statuses = ["ISSUED"]
}
