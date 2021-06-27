# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }


terraform {
  backend "s3" {
    bucket = "bond-tf-state"
    key    = "env/poc"
    region = "us-east-2"
  }
}