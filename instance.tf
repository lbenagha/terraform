resource "aws_instance" "demo" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups        = [aws_security_group.demo.name]
  provisioner "local-exec" {
     command = "echo aws_instance.demo.public_ip >> public_ip.txt"
  }
}
