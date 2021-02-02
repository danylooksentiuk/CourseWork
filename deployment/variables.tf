variable "region" {
  default     = "eu-west-2" //london
}

variable "ami_ubuntu"{
  default = "ami-0ff4c8fb495a5a50d"
}

variable "instance_type" {
  default     = "t2.micro"
}

variable "vpc_id"{
  default = "vpc-fda8f095"
}

variable "subnet_id" {
  default = "subnet-36b3915f"
}


variable "key_name" {
  default = "danylo-ssh"
}
