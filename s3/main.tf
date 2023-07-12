provider "aws" {
  region     = "eu-north-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "jj975novapomoyka"

  tags = {
    Name        = "Справжня помойка"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "example_object_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "terraform.sh"
  source = "/home/u/terraform.sh"
}


resource "aws_s3_bucket_cors_configuration" "example_cors" {
  bucket = aws_s3_bucket.my_bucket.id

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = [file("url.txt")]
  }
}


