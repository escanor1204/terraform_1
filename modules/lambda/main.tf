module "label" {
  source = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.25.0" 
  context = var.context
  name = var.name
}

module "label_get_all_author" {
  source = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.25.0" 
  context = var.context
  name = "get-all-authors"
}

module "lambda_get-all-authors" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.20.1"

  function_name = module.label_get_all_author.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get-all-authors"

  environment_variables = {
    TABLE_NAME = var.authors_table 
  }
  attach_policy_statements = true
  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:Scan"],
      resources = ["${var.authors_table_arn}"]
    } 
  }
  tags = module.label_get_all_author.tags
}

module "label_delete_courses" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "delete_courses"
}

module "lambda_delete_courses" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "7.20.1"
  function_name = module.label_delete_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/delete-courses"

  environment_variables = {
    TABLE_NAME = var.courses_table
  }
  attach_policy_statements = true

  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:DeleteItem"],
      resources = ["${var.courses_table_arn}"]
    }
  }

  tags = module.label.tags 
}
module "label_get_all_courses" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "get_all_courses"
}

module "lambda_get_all_courses" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "7.20.1"
  function_name = module.label_get_all_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get-all-courses"

  environment_variables = {
    TABLE_NAME = var.courses_table
  }
  attach_policy_statements = true

  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:Scan"],
      resources = ["${var.courses_table_arn}"]
    }
  }

  tags = module.label.tags
}
module "label_get_one_courses" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "get_one_courses"
}

module "lambda_get_one_courses" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "7.20.1"
  function_name = module.label_get_one_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get-one-courses"

  environment_variables = {
    TABLE_NAME = var.courses_table
  }
  attach_policy_statements = true

  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:GetItem"],
      resources = ["${var.courses_table_arn}"]
    }
  }

  tags = module.label.tags
  
}
module "label_save_courses" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "save_courses"
}

module "lambda_save_courses" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "7.20.1"
  function_name = module.label_save_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/save-courses"

  environment_variables = {
    TABLE_NAME = var.courses_table
  }
  attach_policy_statements = true

  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:PutItem"],
      resources = ["${var.courses_table_arn}"]
    }
  }

  tags = module.label.tags
  
}
module "label_update_courses" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name    = "update_courses"
}

module "lambda_update_courses" {
  source        = "terraform-aws-modules/lambda/aws"
  version       = "7.20.1"
  function_name = module.label_update_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/update-courses"

  environment_variables = {
    TABLE_NAME = var.courses_table
  }
  attach_policy_statements = true

  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:PutItem"],
      resources = ["${var.courses_table_arn}"]
    }
  }

  tags = module.label.tags
  
}
