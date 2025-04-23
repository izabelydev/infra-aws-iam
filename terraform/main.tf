module "iam" {
  source      = "./modules/iam"
  username    = var.username
  policy_name = var.policy_name
}