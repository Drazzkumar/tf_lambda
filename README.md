# Terraform lambda infrastructure and deployment with layers

## Initliazation of terraform

```bash
    terraform init
```

## setup python
```bash
    virtualenv .env
    source .env/bin/activate
    pip install requirement.txt
```

## setup zip lambda layer

```bash
    pip install requirement.txt -t vendor/python
    zip -r zip zip_files/vendor_layer.zip vendor/
```

## deploy lambda

```bash
    terraform plan -out "lambda.plan"
    terraform apply "lambda.plan"
```

