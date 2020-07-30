module "my_lambda" {
    source = "../modules/lambda"
    function_name = "demo-lambda"
    handler = "index.handler"
    runtime = "nodejs12.x"
    timeout = 300
    file_location = "${local.zip_file_location}"
    environment_variables = {
      Environment = "test"
      BU = "MC_IT"
    }

}
locals{
     zip_file_location = "src.zip"
}


data "archive_file" "nodejs" {
     type        = "zip"
     source_dir = "src"
     output_path = "${local.zip_file_location}"
}
