provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "${var.region}"
}

resource "aws_instance" "example" {
    ami             = "${lookup(var.amis, var.region)}"
    instance_type   = "t2.medium"

    associate_public_ip_address = "true"

    vpc_security_group_ids = ["${aws_security_group.elastic.id}"]

    key_name = "${aws_key_pair.key-demo.id}"

    tags {
        Name = "terraform-instance-demo"
    }
}

resource "aws_key_pair" "key-demo" {
    key_name = "key-demo"
    public_key = "${file(var.key_pair)}"
}

resource "aws_security_group" "elastic" {
    name = "elastic"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # kibaba port
    ingress {
        from_port = 5601
        to_port = 5601
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "ip" {
    description = "ip"
    value = ["${aws_instance.example.public_ip}"]
}