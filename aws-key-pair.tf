# creating ssh key 
resource "aws_key_pair" "key-tf"{
    key_name= "${var.key_name}"
#    public_key= "${var.public_key}"
   public_key= file("${path.module}/id_rsa3.pub")
}

output "key_name"{
    value= "${aws_key_pair.key-tf.key_name}"
}
