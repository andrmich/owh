resource "aws_dynamodb_table" "tfstate" {
  name         = "terraform-state-locking" # hardcoded in state.tf !
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name      = "Terraform State File Locking"
    Terraform = true
  }
}

output "tfstate_dynamodb_table" {
  value = aws_dynamodb_table.tfstate.name
}
