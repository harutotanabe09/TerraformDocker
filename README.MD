## 利用方法

### 環境構築手順

1. 設定ファイルのコピー

```shell
cp .env.example .env
```

2. 設定ファイルのコピー

```shell
vim .env
```

3. Docker起動&コンテナ確認

```shell
docker-compose up -d
docker-compose exec terraform /bin/ash
```

4. コンテナ内でTerraform実行

```shell
terraform init
terraform plan
terraform fmt
terraform apply
```

#### トラブルシューティング

##### 初期化
```shell
terraform init -reconfigure
```

##### Terraformのバージョンを上げたい

Dockerファイルのterraformのバージョン変更

###### 初期化
```shell
terraform init -reconfigure
```

### file

main.tf : 変数ファイル
terraform.tf : stateファイルの保存先
versions.tf : バージョン指定
provider.tf : プラグイン

