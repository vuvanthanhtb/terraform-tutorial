module "my_app" {
  source   = "../my-module"
  ami      = "ami-0e449927258d45bc4"
  myRegion = "us-east-1"
}
