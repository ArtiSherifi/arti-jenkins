provider "aws" {
    access_key = "AKIAUUTQHAXHUIYEM2X7"
    secret_key = "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"
    region = "eu-central-1"
}

resource "aws_instance" "my-instance" {
    ami = "ami-09cb21a1e29bcebf0"
    instance_type = "t2.micro"

    tags = {
        Name = "server from jenkins"
    }
}