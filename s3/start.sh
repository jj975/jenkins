aws s3 presign s3://jj975novapomoyka/terraform.sh --expires-in 18000 > url.txt
terraform apply -auto-approve
cat url.txt