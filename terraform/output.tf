output "rds_endpoint" {
  value = aws_db_instance.mydb.address
}


output "rds_port" {
  value = aws_db_instance.mydb.port
}


output "redis_port" {
  value =  aws_elasticache_replication_group.elastic_redis_cluster.port
}


output "redis_cluster_endpoint" {
  value = aws_elasticache_replication_group.elastic_redis_cluster.primary_endpoint_address
}