resource "aws_instance" "myapp-ec2"{
    ami = "ami-05c13eab67c5d8861"
    instance_type = var.ins_type
    subnet_id = aws_subnet.dev_subnet-1.id
    vpc_security_group_ids = [aws_security_group.my-app-sg.id]
    availability_zone = var.avail_zone
    associate_public_ip_address = true
    key_name = var.keyname
    user_data = <<EOF
                    #!/bin/bash
                    sudo yum update -y
                    sudo yum install docker -y
                    sudo systemctl start docker
                    sudo usermod -aG docker ec2-user
                    docker pull nginx
                    docker run -idt -p 8080:80 nginx 
                EOF    
    tags = {
        Name = "${var.env_prefix}-instance"
    }
}

output public_ip {
  value       = aws_instance.myapp-ec2.public_ip
}
