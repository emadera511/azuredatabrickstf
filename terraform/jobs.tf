resource "databricks_job" "terraformcicd" {
    name = "TerraformCICD" 

    cluster_id = databricks_cluster.this.id

    #Define task for the first notebook 

    task {
        task_key = "notebook1_task" 
    }

    notebook_task {
        notebook_path = "/Workspace/notebook/notebook1"
    }

    #Define the Second Task 

    task { 
        task_key = "notebook2_task" 

        notebook_path = "/Workspace/notebook/notebook2"
        depends_on = ["notebook1_task"]
    }

}