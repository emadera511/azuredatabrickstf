data "databricks_node_type" "smallest" {
    local_disk = true 

}

data "databricks_spark_version" "latest_lts" {
    long_term_support = true 
}

resource "databricks_cluster" "this" {
    cluster_name            =var.cluster_name
    node_type_id            =data.databricks_node_type.smallest.id 
    spark_version           =data.databricks_spark_version.lastest_lts.id 
    autotermination_minutes =var.Cluster_autotermination_minutes 
    num_workers             =var.cluster_num_workers
    data_security_mode      =var.cluster_data_security_mode 
}

output "cluster_url" {
    value = databricks_cluster.this.url
}