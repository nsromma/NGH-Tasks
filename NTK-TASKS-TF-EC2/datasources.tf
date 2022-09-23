data "aws_ami" "ntk-server" {
    most_recent = true
    owners = ["137112412989"]

    filter {
      name = "name"
      values =["amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2"]
    }
  
}