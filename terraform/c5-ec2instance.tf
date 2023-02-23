# Three EC2 Instances for nexus, jenkins and sonarcube

# Jenkis server
resource "aws_instance" "jenkins" {
  ami = "ami-0beaa649c482330f7"
  instance_type = var.instance_type
  user_data = file("${path.module}/jenkins-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "EC2 Jenkins"
  }
}

# Nexus server

# Sonarqube server
