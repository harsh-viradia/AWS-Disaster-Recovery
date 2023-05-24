# module "nlb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 8.0"

#   name               = "harsh-viradia-region-1-alb"
#   load_balancer_type = "network"

#   vpc_id  = "${aws_vpc.harsh-viradia-vpc-1.id}"
#   subnets = ["${aws_subnet.harsh-viradia-1-subnet3.id}", "${aws_subnet.harsh-viradia-1-subnet4.id}"]
#   #   security_groups       = [module.app_security_group.security_group_id]
#   create_security_group = true
#   internal              = true

#   target_groups = [
#     {
#       name_prefix      = "harsh-"
#       backend_protocol = "TCP"
#       bakcend_port     = 80
#       target_type      = "instance"
#       stikckiness      = { "enabled" = true, "type" = "lb_cookie" }
#       health_check = {
#         matcher  = "200-399"
#         path     = "/icon/"
#         interval = 120
#         timeout  = 30
#       }
#     }
#   ]

#   http_tcp_listeners = [
#     {
#       port     = 80
#       protocol = "TCP"
#     }
#   ]
# }
