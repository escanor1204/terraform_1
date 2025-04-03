module "label_courses" {
  source = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.25.0"

  namespace   = var.namespace
  stage       = var.stage
  environment = var.environment
  label_order = var.label_order
  name = "course"
}

module "label_authors" {
  source = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.25.0"

  namespace   = var.namespace
  stage       = var.stage
  environment = var.environment
  label_order = var.label_order
  name = "authors"
}

resource "aws_dynamodb_table" "courses" {
  name         = module.label.id
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TestTableHashKey"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}

resource "aws_dynamodb_table" "authors" {
  name         = module.label.id
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TestTableHashKey"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}
