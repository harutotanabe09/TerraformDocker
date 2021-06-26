cp .env.example .env
vim .env
docker-compose up -d
docker-compose exec terraform /bin/ash

terraform init
terraform plan
terraform fmt
terraform apply