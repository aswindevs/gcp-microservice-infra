output "cluster_name" {
    value = google_container_node_pool.pool.cluster
}

output "node_pool_name" {
    value = google_container_node_pool.pool.name
}