resource "aws_instance" "myapp-ec2"{
    ami = "ami-05c13eab67c5d8861"
    vpc_id = aws_vpc.development_vpc.id
    instance_type = var.ins_type
    subnet_id = aws_subnet.dev_subnet-1.id
    vpc_security_group_id = aws_security_group.my-app-sg.id
    availability_zone = var.avail_zone
    associate_public_ip_address = true
    key_name = var.keyname
    tags = {
        Name = "${var.env_prefix}-instance"
    }
}