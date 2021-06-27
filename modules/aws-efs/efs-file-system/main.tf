resource "aws_efs_file_system" "this" {
    
  count = var.create_efs ? 1 : 0
    
  creation_token = var.creation_token

  tags = {
    Name = var.creation_token
  }
}