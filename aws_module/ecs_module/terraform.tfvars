availability_zone_1a = "us-east-1a"

availability_zone_1b = "us-east-1b"


ecsRegion = "us-east-1"

family_name_task_def = "New_task"

launch_types = ["FARGATE"]

Task_Networking_mode = "awsvpc"


# define_image = var.

container_port = 3000

host_port = 3000

cluster_name = "clusterhotstar"

ecs_service_name = "servicehotstar"

desired_no_count = 1

ecs_from_port_r1 = 3000

ecs_to_port_r1 = 3000


repo_name = "my-default-repo-name"
img_scanning = true
repo_tag_mutability = "MUTABLE"
github_repo_url = "https://github.com/dixitrathi7/Hotstar-Clone"








