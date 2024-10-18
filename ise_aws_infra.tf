
# Create network interface for ISE - AZ1
resource "aws_network_interface" "ise_pan_gig0" {
  subnet_id       = aws_subnet.private_subnet[0].id
  private_ips     = [var.ise_pan_gig0_ip]
  security_groups = [aws_security_group.ise_network_access.id]
      tags = {
    "Name" = "ise_pan"
  }

}
# Create network interface for ISE - AZ2
resource "aws_network_interface" "ise_san_gig0" {
  subnet_id       = aws_subnet.private_subnet[1].id
  private_ips     = [var.ise_san_gig0_ip]
  security_groups = [aws_security_group.ise_network_access.id]
    tags = {
    "Name" = "ise_san"
  }
}

# Create two ISE instances in the private subnets

resource "aws_instance" "ise_pan" {
  ami               = var.ise_ami_3_3_us_east_1
  availability_zone = var.iselab_az1
  instance_type     = var.ise_instance_type
  key_name          = var.key_name
  network_interface {
    network_interface_id = aws_network_interface.ise_pan_gig0.id
    device_index         = 0
  }
  tags = {
    "Name" = "ise_pan"
  }
  user_data = file("ise_pan_3_3.txt")
  
  # Check Storage Type aligns to ISE version & Persona Recommendations
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 300
    volume_type = "gp2"
  }
}

resource "aws_instance" "ise_san" {
  ami               = var.ise_ami_3_3_us_east_1
  availability_zone = var.iselab_az2
  instance_type     = var.ise_instance_type
  key_name          = var.key_name
  network_interface {
    network_interface_id = aws_network_interface.ise_san_gig0.id
    device_index         = 0
  }
  tags = {
    "Name" = "ise_san"
  }
  user_data = file("ise_san_3_3.txt")


  # Check Storage Type aligns to ISE version & Persona Recommendations
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 300
    volume_type = "gp2"
  }
}
