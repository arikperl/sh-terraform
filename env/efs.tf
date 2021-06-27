### Create the efs file system
#####################################

module "efs_file_system" {
    source         = "../modules/aws-efs/efs-file-system"

    creation_token = "efs-${var.env_suffix}"
}

module "efs_mount_target_1" {
    source          = "../modules/aws-efs/efs-mount-target"

    file_system_id  = module.efs_file_system.this_efs_id
    subnet_id       = "subnet-03a3009f3e341222f"
    security_groups = ["${module.sg_efs.this_security_group_id}"] 
}

module "efs_mount_target_2" {
    source          = "../modules/aws-efs/efs-mount-target"

    file_system_id  = module.efs_file_system.this_efs_id
    subnet_id       = "subnet-0693091c4f184d547"
    security_groups = ["${module.sg_efs.this_security_group_id}"] 
}