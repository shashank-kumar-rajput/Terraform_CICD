
#Creating Instance
resource "aws_instance" "ec2_terraform1"{
 ami = "${var.ami_linux}"
 instance_type= "${var.ec2_instance_type1}"
 key_name="${aws_key_pair.key-tf.key_name}"
 vpc_security_group_ids = ["${aws_security_group.Custome-security-group-tf.id}"]
 user_data = file("${path.module}/script.sh")
 tags={
    Name="${var.ec2_instance_name}"
 }

}

