terraform {
  required_version = ">= 1.5.0"

  backend "local" {
    # state ファイルのパス（envs/dev 配下に作られる）
    path = "terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
  profile = "default" # aws configure した時のプロファイル名
}
