
#################################################
# Create Route 53 with wanted record
################################################

// module "instance_services" {
//   source                = "../modules/aws-ec2"

//   name                  = "${var.tg_suffix}-BOND-SERVICES-01"
//   ami                   = "ami-09b1fd2634456027a" 
//   instance_type         = "t3.large"
//   vpc_security_group_ids = module.sg_services.this_security_group_id
//   subnet_id             = "subnet-0938d2def00429163"
//   iam_instance_profile  = "BOND-SQS-ROLE-STG"
// }

module "instance_mongo" {
  source                = "../modules/aws-ec2"

  name                  = "${var.tg_suffix}-BOND-MONGO-01"
  ami                   = "ami-0cf96c6fae762ba0e"
  instance_type         = "t2.medium"
  vpc_security_group_ids = module.sg_mongo.this_security_group_id
  subnet_id             = "subnet-03a3009f3e341222f"
  iam_instance_profile  = "BOND-SQS-ROLE-STG"
}