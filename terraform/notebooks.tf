resource "databricks_notebook" "notebook1" {
    path   = "/Workspace/notebook1"
    content_based64 = base64encode(file("./modules/notebook1.py"))
}

resource "databricks_notebook" "notebook2" {
    path  = "/Workspace/notebook2"
    content_based64 = base64encode(file("./modules/notebook1.py"))

}