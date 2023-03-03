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
   default = [20,22,80,3306,443,27017]
}
variable "versioning" {
    type        = bool
    description = "(Optional) A state of versioning."
    default     = true
}
variable "acl" {
    type        = string
    description = " Defaults to private "
    default     = "private"
}
variable "bucket_prefix" {
    type        = string
    description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix"
    default     = "my-s3bucket-"
}
variable "tags" {
    type        = map
    description = "(Optional) A mapping of tags to assign to the bucket."
    default     = {
        environment = "DEV"
        terraform   = "true"
    }
}