variable "ami_linux" {
type= string
}
variable "ec2_instance_type1" {
    type=string
  default = "t2.micro"
}
variable "secret_key" {
type=string
}
variable "access_key" {
type=string
}
variable "public_key" {

}
variable "key_name" {
type=string
}
variable "ec2_instance_name"{ 
type=string
}
variable ports {
    type= list(number)
   
}