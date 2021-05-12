# az login
# az account set -s $(az account show --query id --output tsv) --only-show-error

$RG = "myRGWebApp1"
$LOCATION = "eastus"
$PLAN = "MyPlan"
$random = Get-Random
$NAME ="myDockerWebApp" + $random

az group create --name $RG --location $LOCATION --no-wait
az appservice plan create --name $PLAN --resource-group $RG --sku FREE --is-linux --no-wait 
az webapp create -g $RG -p $PLAN -n $NAME -i microsoft/aci-helloworld --no-wait


az group delete --name $RG --no-wait -y --only-show-errors

##exemplo
# #!/bin/bash

# # Replace the following URL with a public GitHub repo URL
# gitrepo=https://github.com/Azure-Samples/php-docs-hello-world
# webappname=mywebapp$RANDOM

# # Create a resource group.
# az group create --location westeurope --name myResourceGroup

# # Create an App Service plan in `FREE` tier.
# az appservice plan create --name $webappname --resource-group myResourceGroup --sku FREE

# # Create a web app.
# az webapp create --name $webappname --resource-group myResourceGroup --plan $webappname

# # Deploy code from a public GitHub repository. 
# az webapp deployment source config --name $webappname --resource-group myResourceGroup \
# --repo-url $gitrepo --branch master --manual-integration

# # Copy the result of the following command into a browser to see the web app.
# echo http://$webappname.azurewebsites.net