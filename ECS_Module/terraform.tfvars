availability_zone_1a = "us-east-1a"

availability_zone_1b = "us-east-1b"


ecsRegion = "us-east-1"

family_name_task_def = "New_task"

launch_types = ["FARGATE"]

Task_Networking_mode = "awsvpc"


define_image = "050515008040.dkr.ecr.us-east-1.amazonaws.com/jenkinshotstarimages:v1"

container_port = 3000

host_port = 3000

cluster_name = "clusterhotstar"

ecs_service_name = "servicehotstar"

desired_no_count = 1

ecs_from_port_r1 = 3000

ecs_to_port_r1 = 3000








