# Three EC2 Instances for nexus, jenkins and sonarcube

# Jenkins Ubuntu server
resource "aws_instance" "jenkins" {
  ami = "ami-0568936c8d2b91c4e"
  instance_type = "t2.small"
  user_data = file("${path.module}/jenkins-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-jenkins.id]
  tags = {
    "Name" = "EC2 Jenkins"
  }
}

# Nexus Amazon server
resource "aws_instance" "nexus" {
  ami = "ami-0cc87e5027adcdca8"
  instance_type = "t2.medium"
  user_data = file("${path.module}/nexus-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-nexus.id]
  tags = {
    "Name" = "EC2 Nexus"
  }
}

# Sonarqube server
resource "aws_instance" "sonar" {
  ami = "ami-03a5def6b0190cef7"
  instance_type = "t2.medium"
  user_data = file("${path.module}/sonar-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-sonar.id]
  tags = {
    "Name" = "EC2 Sonar"
  }
}