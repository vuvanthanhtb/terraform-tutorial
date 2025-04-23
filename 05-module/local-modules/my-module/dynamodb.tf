resource "aws_dynamodb_table" "myDynamoDB" {
  name         = "employees"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "EmployeeID"
  attribute {
    name = "EmployeeID"
    type = "N"
  }
}
