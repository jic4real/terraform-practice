provider  "aws"{
    region     = "af-south-1"
}

variable "subnet_cidr_block"{
    description = "subnet cidr block"
}

resource "aws_vpc" "testing_vpc"{
    cidr_block  = "10.0.0.0/16"
    tags = {
        Name: "Testing"
    }
}

resource "aws_subnet" "test_subnet-1"{
    vpc_id       = aws_vpc.testing_vpc.id
    cidr_block   = var.subnet_cidr_block
    availability_zone = "af-south-1a"
}

data "aws_vpc" "existing_vpc"{
    default = true
}

resource "aws_subnet" "test_subnet-2"{
    vpc_id     = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "af-south-1a"
}