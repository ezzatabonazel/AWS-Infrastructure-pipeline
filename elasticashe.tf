
resource "aws_elasticache_subnet_group" "subnets" {
  name       = "cache-subnet"
  subnet_ids = [module.network.private2_subnet_id,module.network.private1_subnet_id]
}



resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "elsticache"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name = aws_elasticache_subnet_group.subnets.id
}