variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "ap-southeast-1"
}

variable "key_pair" {}

variable "amis" {
    type    = "map"
    default = {
        "cn-north-1" = "ami-fba67596",
        "ap-northeast-2" = "ami-ab77d4c5"
        "ap-southeast-1" = "ami-52d4802e"
    }
}