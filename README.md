# PAS installation pipeline on Azure

![image](https://user-images.githubusercontent.com/106908/41267576-e6ecfa02-6e36-11e8-8d7c-85d230e1f9d5.png)


1. Create an automation account with the following instruction

https://github.com/pivotal-cf/terraforming-azure#creating-an-automation-account

2. Create a storage container to store a terraform state file used in the pipeline

```
# CLIENT_ID, CLIENT_SECRET, TENANT_ID are written in the tfvars file created by az-automation

az login --username $CLIENT_ID \
         --password $CLIENT_SECRET \
         --service-principal \
         --tenant $TENANT_ID 

az group create --name "pcfci" \
  --location "Japan East"

az storage account create --name "pcfpipeline" \
  --resource-group "pcfci" \
  --location "Japan East" \
  --sku "Standard_LRS"

az storage container create --name terraformstate \
  --account-name pcfpipeline
```

Copy `credentials.sample.yml` to `credentials.yml` and Edit it for your environment. 