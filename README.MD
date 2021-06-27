cp .env.example .env
vim .env
docker-compose up -d
docker-compose exec terraform /bin/ash

terraform init
terraform plan
terraform fmt
terraform apply

### file

main.tf : 変数ファイル
terraform.tf : stateファイルの保存先
versions.tf : バージョン指定
provider.tf : プラグイン

