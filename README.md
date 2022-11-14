# Error


PS C:\Users\saura\Desktop\Terraform\tf> terraform plan
aws_launch_configuration.windows: Refreshing state... [id=foo]
aws_vpc.sauravVPC: Refreshing state... [id=vpc-0458e0b6d45d07ca5]
aws_route_table.sauravkr: Refreshing state... [id=rtb-021418c0f06c50164]
aws_internet_gateway.igw: Refreshing state... [id=igw-04d14c27bb42bf2e0]
aws_subnet.mySubnet: Refreshing state... [id=subnet-0a6a3bc2e6cdfbefb]  
aws_security_group.saurav: Refreshing state... [id=sg-0704fadedb265ab91]
aws_route.r: Refreshing state... [id=r-rtb-021418c0f06c501641080289494]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # aws_autoscaling_group.windows will be created
  + resource "aws_autoscaling_group" "windows" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 2
      + force_delete              = false
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "ELB"
      + id                        = (known after apply)
      + launch_configuration      = "{aws_launch_configuration.windows.foo}"
      + load_balancers            = [
          + "aws_elb.web_elb.id}",
        ]
      + max_size                  = 4
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "aws_launch_configuration.windows.foo"  
      + name_prefix               = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
    }

  # aws_autoscaling_policy.windows_policy_up will be created
  + resource "aws_autoscaling_policy" "windows_policy_up" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "aws_autoscaling_group.windows.foo}"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "windows_policy_up"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_route_table.sauravkr will be updated in-place
  ~ resource "aws_route_table" "sauravkr" {
        id               = "rtb-021418c0f06c50164"
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - core_network_arn           = ""
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "igw-04d14c27bb42bf2e0"
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ]
        tags             = {
            "Name" = "sauravkr"
        }
        # (5 unchanged attributes hidden)
    }

  # aws_security_group.elb_http will be created
  + resource "aws_security_group" "elb_http" {
      + arn                    = (known after apply)
      + description            = "ALLOW HTTP traffic to instance through Elastic Load Balancer,ssh"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "elb_http"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = "aws_vpc.sauravVPC.id"
    }

Plan: 3 to add, 1 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
PS C:\Users\saura\Desktop\Terraform\tf> terraform apply
aws_launch_configuration.windows: Refreshing state... [id=foo]
aws_vpc.sauravVPC: Refreshing state... [id=vpc-0458e0b6d45d07ca5]
aws_internet_gateway.igw: Refreshing state... [id=igw-04d14c27bb42bf2e0]
aws_route_table.sauravkr: Refreshing state... [id=rtb-021418c0f06c50164]
aws_subnet.mySubnet: Refreshing state... [id=subnet-0a6a3bc2e6cdfbefb]
aws_security_group.saurav: Refreshing state... [id=sg-0704fadedb265ab91]
aws_route.r: Refreshing state... [id=r-rtb-021418c0f06c501641080289494]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # aws_autoscaling_group.windows will be created
  + resource "aws_autoscaling_group" "windows" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 2
      + force_delete              = false
      + force_delete_warm_pool    = false
      + health_check_grace_period = 300
      + health_check_type         = "ELB"
      + id                        = (known after apply)
      + launch_configuration      = "{aws_launch_configuration.windows.foo}"
      + load_balancers            = [
          + "aws_elb.web_elb.id}",
        ]
      + max_size                  = 4
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "aws_launch_configuration.windows.foo"
      + name_prefix               = (known after apply)
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
    }

  # aws_autoscaling_policy.windows_policy_up will be created
  + resource "aws_autoscaling_policy" "windows_policy_up" {
      + adjustment_type         = "ChangeInCapacity"
      + arn                     = (known after apply)
      + autoscaling_group_name  = "aws_autoscaling_group.windows.foo}"
      + cooldown                = 300
      + enabled                 = true
      + id                      = (known after apply)
      + metric_aggregation_type = (known after apply)
      + name                    = "windows_policy_up"
      + policy_type             = "SimpleScaling"
      + scaling_adjustment      = 1
    }

  # aws_route_table.sauravkr will be updated in-place
  ~ resource "aws_route_table" "sauravkr" {
        id               = "rtb-021418c0f06c50164"
      ~ route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - core_network_arn           = ""
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "igw-04d14c27bb42bf2e0"
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ]
        tags             = {
            "Name" = "sauravkr"
        }
        # (5 unchanged attributes hidden)
    }

  # aws_security_group.elb_http will be created
  + resource "aws_security_group" "elb_http" {
      + arn                    = (known after apply)
      + description            = "ALLOW HTTP traffic to instance through Elastic Load Balancer,ssh"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "elb_http"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = "aws_vpc.sauravVPC.id"
    }

Plan: 3 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group.elb_http: Creating...
aws_autoscaling_policy.windows_policy_up: Creating...
aws_autoscaling_group.windows: Creating...
aws_route_table.sauravkr: Modifying... [id=rtb-021418c0f06c50164]
aws_route_table.sauravkr: Modifications complete after 1s [id=rtb-021418c0f06c50164]
╷
│ Error: creating Security Group (elb_http): InvalidVpcID.NotFound: The vpc ID 'aws_vpc.sauravVPC.id' does not exist
│       status code: 400, request id: 73b1b91c-a5b4-4882-a3d3-ac95b6315558
│
│   with aws_security_group.elb_http,
│   on provider.tf line 83, in resource "aws_security_group" "elb_http":
│   83: resource "aws_security_group" "elb_http" {
│
╵
╷
│ Error: creating Auto Scaling Group (aws_launch_configuration.windows.foo): ValidationError: Launch configuration name not found - A launch configuration with the name: {aws_launch_configuration.windows.foo} does not exist
│       status code: 400, request id: 44dda1f8-fc07-4c84-995c-a9c3a4d39708
│
│   with aws_autoscaling_group.windows,
│   on provider.tf line 120, in resource "aws_autoscaling_group" "windows":
│  120: resource "aws_autoscaling_group" "windows" {
│
╵
╷
│ Error: creating Auto Scaling Policy (windows_policy_up): ValidationError: Group aws_autoscaling_group.windows.foo} not found
│       status code: 400, request id: d4a33d64-7ac4-4ed4-92bd-8a115c927eaa
│
│   with aws_autoscaling_policy.windows_policy_up,
│   on provider.tf line 136, in resource "aws_autoscaling_policy" "windows_policy_up":
│  136: resource "aws_autoscaling_policy" "windows_policy_up" {
│
╵
PS C:\Users\saura\Desktop\Terraform\tf>