
resource "aws_elasticache_subnet_group" "subnets" {
  name       = "cache-subnet"
  subnet_ids = [module.network.private2_subnet_id, module.network.private1_subnet_id]
}



# resource "aws_elasticache_cluster" "cache" {
#   cluster_id           = "elsticache"
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = "default.redis3.2"
#   engine_version       = "3.2.10"
#   port                 = 6379
#   subnet_group_name    = aws_elasticache_subnet_group.subnets.id
#   security_group_ids   = [aws_security_group.elastic-cache-sg.id]
# }



resource "aws_elasticache_replication_group" "elastic_redis_cluster" {
  automatic_failover_enabled  = true
  subnet_group_name = aws_elasticache_subnet_group.subnets.name
  replication_group_id        = "tf-rep-group-1"
  description = "elastiCache Redis Cluster"
  node_type                   = "cache.t2.micro"
  num_cache_clusters       = 2
  port                        = 6379
  engine_version       = "6.x"
  security_group_ids = [aws_security_group.elastic-cache-sg.id]
}