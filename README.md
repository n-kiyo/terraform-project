# terraform-project
## terraform basic commands
### **初期化まわり**
terraform init          # プロジェクト初期化（provider/plugin ダウンロード）  
terraform init -upgrade # provider/plugin のバージョンを更新して再初期化  

### **コード整形・構文チェック**
terraform fmt                 # カレントディレクトリを整形  
terraform fmt -recursive .    # 配下ディレクトリも含めて整形  
terraform validate            # HCL の構文/整合性チェック


### **Plan / Apply / Destroy**  
terraform plan                        # 変更プラン表示  
terraform plan -out=tfplan            # プランをファイル出力  
terraform apply                       # 実際に反映（対話プロンプトあり）  
terraform apply tfplan                # 保存したプランを適用  
terraform destroy                     # 管理対象リソースを削除  
terraform destroy -target=xxx.yyy     # 特定リソースだけ削除

### **状態確認・出力**
terraform show            # state or plan の中身を表示  
terraform state list      # 管理しているリソース一覧  
terraform state show xxx  # 特定リソースの詳細  
terraform output          # output 変数の表示  
terraform output name     # 特定の output の表示

### **ワークスペース（必要になったとき用）**
terraform workspace list           # ワークスペース一覧  
terraform workspace new dev        # 新規作成  
terraform workspace select dev     # 切り替え  


## base networking plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "terraform-dev-main-igw"
        }
      + tags_all = {
          + "Name" = "terraform-dev-main-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route.public_internet_access will be created
  + resource "aws_route" "public_internet_access" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "dev-public-rt"
        }
      + tags_all         = {
          + "Name" = "dev-public-rt"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.public_1a_assoc will be created
  + resource "aws_route_table_association" "public_1a_assoc" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_s3_bucket.example will be created
  + resource "aws_s3_bucket" "example" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "narikiyo-terraform-dev-bucket-202511291630"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "dev"
          + "Nmae"        = "terraform-dev-bucket"
        }
      + tags_all                    = {
          + "Environment" = "dev"
          + "Nmae"        = "terraform-dev-bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_subnet.public_1a will be created
  + resource "aws_subnet" "public_1a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "terraform-dev-public-1a"
        }
      + tags_all                                       = {
          + "Name" = "terraform-dev-public-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "terraform-dev-main-vpc"
        }
      + tags_all                             = {
          + "Name" = "terraform-dev-main-vpc"
        }
    }

  # random_pet.example will be created
  + resource "random_pet" "example" {
      + id        = (known after apply)
      + length    = 2
      + separator = "-"
    }

Plan: 8 to add, 0 to change, 0 to destroy.

```
